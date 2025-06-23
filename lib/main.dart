import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walk_tracker_challenge/core/l10n/app_localizations.dart';
import 'package:walk_tracker_challenge/main_screen.dart';
import '/core/themes/app_theme.dart';
import 'features/user_auth/presentation/screens/user_auth_screen.dart';
import '/features/daily_activities/data/repositories/daily_activities_repository_impl.dart';
import '/features/daily_activities/presentation/bloc/daily_activities_bloc.dart';
import '/features/account/data/repositories/account_repository_impl.dart';
import '/features/account/presentation/bloc/account_bloc.dart';
import '/features/journal/data/repositories/journal_repository_impl.dart';
import '/features/journal/presentation/bloc/journal_bloc.dart';
import '/features/user_auth/data/repositories/user_auth_repository_impl.dart';
import '/features/user_auth/presentation/bloc/user_auth_bloc.dart';
import 'package:rive_native/rive_native.dart' as rive;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await rive.RiveNative.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
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
            create: (context) =>
                AccountBloc(repository: context.read<AccountRepositoryImpl>()),
          ),
          BlocProvider(
            create: (context) =>
                JournalBloc(repository: context.read<JournalRepositoryImpl>()),
          ),
          BlocProvider(
            create: (context) => UserAuthBloc(
              repository: context.read<UserAuthRepositoryImpl>(),
            ),
          ),
        ],
        child: MaterialApp(
          title: 'Walk Tracker Challenge',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.light,
          supportedLocales: const [Locale('en', ''), Locale('fr', '')],
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          home: const AuthOrMainScreen(),
        ),
      ),
    );
  }
}

class AuthOrMainScreen extends StatelessWidget {
  const AuthOrMainScreen({super.key});

  bool get isLoggedIn => true; // TODO: Replace with real auth check

  @override
  Widget build(BuildContext context) {
    if (isLoggedIn) {
      return MainScreen();
    } else {
      return const UserAuthScreen();
    }
  }
}
