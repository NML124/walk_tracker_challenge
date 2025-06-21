import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/themes/app_diemens.dart';
import '/features/journal/domain/entities/journal_activity.dart';
import '/features/journal/presentation/widgets/journal_activity_card.dart';
import '../bloc/journal_state.dart';
import '../bloc/journal_bloc.dart';

class JournalScreen extends StatelessWidget {
  const JournalScreen({super.key});

  static final List<JournalActivity> demoActivities = [
    JournalActivity(
      distance: 2.5,
      duration: Duration(minutes: 30),
      date: DateTime.now().add(Duration(minutes: 10)),
      activityPeriod: ActivityPeriod.morning,
      trajectory: [
        TrajectoryPoint(lat: 48.8566, lon: 2.3522, timeStamp: DateTime.now()),
      ],
    ),
    JournalActivity(
      distance: 3.1,
      duration: Duration(minutes: 45),
      activityPeriod: ActivityPeriod.afternoon,
      date: DateTime.now(),
      trajectory: [
        TrajectoryPoint(lat: 48.8570, lon: 2.3530, timeStamp: DateTime.now()),
      ],
    ),
    JournalActivity(
      distance: 1.8,
      duration: Duration(minutes: 25),
      activityPeriod: ActivityPeriod.evening,
      date: DateTime.now().add(Duration(minutes: 900)),
      trajectory: [
        TrajectoryPoint(lat: 48.8580, lon: 2.3540, timeStamp: DateTime.now()),
      ],
    ),
    JournalActivity(
      distance: 4.0,
      duration: Duration(minutes: 60),
      activityPeriod: ActivityPeriod.morning,
      date: DateTime.now().add(Duration(days: 10, minutes: 50)),
      trajectory: [
        TrajectoryPoint(lat: 48.8590, lon: 2.3550, timeStamp: DateTime.now()),
      ],
    ),
    JournalActivity(
      distance: 2.2,
      duration: Duration(minutes: 35),
      activityPeriod: ActivityPeriod.afternoon,
      date: DateTime.now().add(Duration(days: 2, minutes: 80)),
      trajectory: [
        TrajectoryPoint(lat: 48.8600, lon: 2.3560, timeStamp: DateTime.now()),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: BlocBuilder<JournalBloc, JournalState>(
        builder: (context, state) {
          return Padding(
            padding: AppDimens.paddingAll32,
            child: Column(
              children: [
                SizedBox(height: (height * 3 / 4)-AppDimens.PADDING_32),
                Expanded(
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: demoActivities.length,
                    itemBuilder: (context, index) {
                      final activity = demoActivities[index];
                      return JournalActivityCard(activity: activity);
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
