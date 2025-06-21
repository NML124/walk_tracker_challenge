import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/daily_activities_state.dart';
import '../bloc/daily_activities_bloc.dart';

class DailyActivitiesScreen extends StatelessWidget {
  const DailyActivitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DailyActivitiesBloc, DailyActivitiesState>(
        builder: (context, state) {
          return const Center(
            child: Text('DailyActivities Screen'),
          );
        },
      ),
    );
  }
}
