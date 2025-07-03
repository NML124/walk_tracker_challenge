import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive_native/rive_native.dart' as rive;

import 'package:walk_tracker_challenge/core/l10n/app_localizations.dart';
import 'package:walk_tracker_challenge/main_screen.dart';
import 'package:walk_tracker_challenge/core/themes/app_theme.dart';
import 'package:walk_tracker_challenge/core/bloc/app_settings_bloc.dart';
import 'package:walk_tracker_challenge/features/user_auth/presentation/screens/user_auth_screen.dart';
import 'package:walk_tracker_challenge/features/daily_activities/data/repositories/daily_activities_repository_impl.dart';
import 'package:walk_tracker_challenge/features/daily_activities/presentation/bloc/daily_activities_bloc.dart';
import 'package:walk_tracker_challenge/features/account/data/repositories/account_repository_impl.dart';
import 'package:walk_tracker_challenge/features/account/presentation/bloc/account_bloc.dart';
import 'package:walk_tracker_challenge/features/journal/data/repositories/journal_repository_impl.dart';
import 'package:walk_tracker_challenge/features/journal/presentation/bloc/journal_bloc.dart';
import 'package:walk_tracker_challenge/features/user_auth/data/repositories/user_auth_repository_impl.dart';
import 'package:walk_tracker_challenge/features/user_auth/presentation/bloc/user_auth_bloc.dart';

/// Entry point for the Walk Tracker Challenge app.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]); // Lock to portrait mode
  await rive.RiveNative.init();
  runApp(const MyApp());
}

/// Root widget for the app, providing repositories, blocs, and theme.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AppSettingsBloc(),
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(create: (_) => DailyActivitiesRepositoryImpl()),
          RepositoryProvider(create: (_) => AccountRepositoryImpl()),
          RepositoryProvider(create: (_) => JournalRepositoryImpl()),
          RepositoryProvider(create: (_) => UserAuthRepositoryImpl()),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => DailyActivitiesBloc(
                repository: context.read<DailyActivitiesRepositoryImpl>(),
              ),
            ),
            BlocProvider(
              create: (context) => AccountBloc(
                repository: context.read<AccountRepositoryImpl>(),
              ),
            ),
            BlocProvider(
              create: (context) => JournalBloc(
                repository: context.read<JournalRepositoryImpl>(),
              ),
            ),
            BlocProvider(
              create: (context) => UserAuthBloc(
                repository: context.read<UserAuthRepositoryImpl>(),
              ),
            ),
          ],
          child: BlocBuilder<AppSettingsBloc, AppSettingsState>(
            builder: (context, settingsState) {
              return MaterialApp(
                title: 'Walk Tracker Challenge',
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                debugShowCheckedModeBanner: false,
                themeMode: settingsState.themeMode,
                supportedLocales: const [Locale('en', ''), Locale('fr', '')],
                locale: settingsState.locale,
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                home: const AuthOrMainScreen(),
              );
            },
          ),
        ),
      ),
    );
  }
}

/// Decides whether to show the main app or the authentication screen.
class AuthOrMainScreen extends StatelessWidget {
  const AuthOrMainScreen({super.key});

  // TODO: Replace with real authentication check
  bool get isLoggedIn => true;

  @override
  Widget build(BuildContext context) {
    return isLoggedIn ? const MainScreen() : const UserAuthScreen();
  }
}
