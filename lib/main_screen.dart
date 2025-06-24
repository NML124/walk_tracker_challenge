import 'package:flutter/material.dart';
import 'package:walk_tracker_challenge/core/l10n/app_localizations.dart';
import 'package:walk_tracker_challenge/core/themes/app_colors.dart';
import 'package:walk_tracker_challenge/core/themes/app_diemens.dart';
import 'package:walk_tracker_challenge/core/widgets/main_feature_cards_animation.dart';
import 'package:walk_tracker_challenge/core/widgets/rive_circle_controller.dart';
import 'package:walk_tracker_challenge/features/account/presentation/screens/account_screen.dart';
import 'package:walk_tracker_challenge/features/journal/presentation/screens/journal_screen.dart';
import '/features/daily_activities/presentation/screens/daily_activities_screen.dart';

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
      body: Stack(
        children: [
          ValueListenableBuilder(
            valueListenable: scrollXPosition,
            builder: (context, value, child) {
              if (scrollXPosition.value <= 1) {
                return Transform.translate(
                  offset: Offset(
                    (width / 2) - AppDimens.PADDING_32,
                    (height * 3 / 4) - AppDimens.PADDING_32 - 200,
                  ),
                  child: SizedBox(
                    width: width / 2,
                    height: 200,
                    child: RiveCircleController(
                      thickness: 15 - (value * 15),
                      colorSleep:
                          Theme.of(context).brightness == Brightness.dark
                          ? AppColors.darkSleep
                          : AppColors.lightSleep,
                      colorSteps:
                          Theme.of(context).brightness == Brightness.dark
                          ? AppColors.darkSteps
                          : AppColors.lightSteps,
                      colorCalories:
                          Theme.of(context).brightness == Brightness.dark
                          ? AppColors.darkFire
                          : AppColors.lightFire,
                      percentageSleep: 60 - (value * 20),
                      percentageSteps: 65 - (value * 20),
                      percentageCalories: 70 - (value * 20),
                      init: () {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          setState(() {});
                        });
                      },
                    ),
                  ),
                );
              } else {
                return SizedBox();
              }
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
