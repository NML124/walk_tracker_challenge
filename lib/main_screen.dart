import 'package:flutter/material.dart';
import 'package:walk_tracker_challenge/core/l10n/app_localizations.dart';
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
  Widget build(BuildContext context) {
    width = MediaQuery.sizeOf(context).width;
    height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Stack(
        children: [
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
              // Met à jour actualPage quand on passe un palier (1, 2, ...)
              int newPage = value.round().clamp(0, 2);
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
         /* ValueListenableBuilder(
            valueListenable: scrollXPosition,
            builder: (context, value, child) {
              return Transform.translate(
                offset: Offset(width / 3, height / 2),
                child: SizedBox(
                  width: 500,
                  height: 500,
                  child: RiveCircleController(
                    thickness: 3,
                    colorSleep: Colors.blue,
                    colorSteps: Colors.green,
                    colorCalories: Colors.red,
                    percentageSleep: 0.7,
                    percentageSteps: 0.5,
                    percentageCalories: 0.9,
                  ),
                ),
              );
            },
          ),*/
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
