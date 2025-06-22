import 'package:flutter/material.dart';
import 'package:walk_tracker_challenge/core/widgets/main_feature_cards_animation.dart';
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
              return MainFeatureCardsAnimation(animValue: value);
            },
          ),
        ],
      ),
    );
  }
}
