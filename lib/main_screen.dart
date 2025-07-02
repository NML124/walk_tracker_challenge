import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walk_tracker_challenge/core/l10n/app_localizations.dart';
import 'package:walk_tracker_challenge/core/themes/app_diemens.dart';
import 'package:walk_tracker_challenge/core/widgets/anim_perso.dart';
import 'package:walk_tracker_challenge/core/widgets/main_feature_cards_animation.dart';
import 'package:walk_tracker_challenge/core/widgets/rive_circle_animation_section.dart';
import 'package:walk_tracker_challenge/core/widgets/rive_circle_controller.dart';
import 'package:walk_tracker_challenge/features/account/presentation/screens/account_screen.dart';
import 'package:walk_tracker_challenge/features/journal/presentation/screens/journal_screen.dart';
import '/features/daily_activities/presentation/screens/daily_activities_screen.dart';
import 'package:walk_tracker_challenge/core/bloc/app_settings_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController pageController = PageController();
  ValueNotifier<double> scrollXPosition = ValueNotifier(0.0);
  int newPage = 0;
  double width = 0.0;
  double height = 0.0;
  int actualPage = 0;

  @override
  void initState() {
    pageController.addListener(() {
      scrollXPosition.value = (pageController.offset / width);
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollXPosition.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.sizeOf(context).width;
    height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: actualPage == 2
            ? Theme.of(context).bottomNavigationBarTheme.backgroundColor
            : null,
        actions: [
          BlocBuilder<AppSettingsBloc, AppSettingsState>(
            builder: (context, state) => Column(
              children: [
                Switch(
                  value: state.themeMode == ThemeMode.dark,
                  onChanged: (val) {
                    context.read<AppSettingsBloc>().add(
                      ChangeThemeMode(val ? ThemeMode.dark : ThemeMode.light),
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(width: AppDimens.PADDING_16),
          BlocBuilder<AppSettingsBloc, AppSettingsState>(
            builder: (context, state) => DropdownButton<Locale>(
              value: state.locale,
              items: const [
                DropdownMenuItem(value: Locale('en'), child: Text('English')),
                DropdownMenuItem(value: Locale('fr'), child: Text('Français')),
              ],
              onChanged: (locale) {
                if (locale != null) {
                  context.read<AppSettingsBloc>().add(ChangeLocale(locale));
                }
              },
            ),
          ),
          SizedBox(width: AppDimens.PADDING_16),
        ],
      ),
      body: Stack(
        children: [
          ValueListenableBuilder(
            valueListenable: scrollXPosition,
            builder: (context, value, child) {
              return RiveCircleAnimationSection(
                value: value,
                width: width,
                height: height,
              );
            },
          ),
          ValueListenableBuilder(
            valueListenable: scrollXPosition,
            builder: (context, value, child) {
              return AnimPerso(
                page: actualPage,
                animationScrollX: value,
                height: height,
                width: width,
              );
            },
          ),
          PageView(
            controller: pageController,
            children: [
              DailyActivitiesScreen(),
              JournalScreen(),
              AccountScreen(),
            ],
          ),
          ValueListenableBuilder(
            valueListenable: scrollXPosition,
            builder: (context, value, child) {
              // Updates currentPage when passing a milestone (1, 2, ...)
              newPage = value.round().clamp(0, 2);
              if (actualPage != newPage) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  setState(() {
                    actualPage = newPage;
                  });
                });
              }
              return MainFeatureCardsAnimation(animValue: value);
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: actualPage,
        onTap: (value) {
          pageController.animateToPage(
            value,
            duration: Duration(seconds: 1),
            curve: Curves.ease,
          );
          setState(() {
            actualPage = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.timeline),
            label: AppLocalizations.of(context)!.dailyGoal,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time_rounded),
            label: AppLocalizations.of(context)!.journal,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: AppLocalizations.of(context)!.profile,
          ),
        ],
      ),
    );
  }
}
