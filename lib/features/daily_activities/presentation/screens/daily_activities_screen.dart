import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walk_tracker_challenge/core/themes/app_colors.dart';
import 'package:walk_tracker_challenge/core/themes/app_diemens.dart';
import 'package:walk_tracker_challenge/features/daily_activities/domain/entities/health_tip.dart';
import 'package:walk_tracker_challenge/features/daily_activities/presentation/widgets/activity_row.dart';
import 'package:walk_tracker_challenge/features/daily_activities/presentation/widgets/health_tip_card.dart';
import '/core/l10n/app_localizations.dart';
import '../bloc/daily_activities_state.dart';
import '../bloc/daily_activities_bloc.dart';

class DailyActivitiesScreen extends StatelessWidget {
  const DailyActivitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DailyActivitiesBloc, DailyActivitiesState>(
        builder: (context, state) {
          // Example list of health tips
          final healthTips = [
            HealthTip(
              title: 'A simple way to stay healthy',
              author: 'Dr Melissa',
            ),
            HealthTip(title: 'Drink more water', author: 'Dr John'),
            HealthTip(title: 'Exercise regularly', author: 'Dr Smith'),
            HealthTip(
              title: 'Exercise regularly',
              author: 'Smith',
              type: HealthTipType.unofficial,
            ),
            HealthTip(title: 'Exercise regularly', author: 'Dr Smith'),
            HealthTip(title: 'Exercise regularly', author: 'Dr Smith'),
            HealthTip(title: 'Exercise regularly', author: 'Dr Smith'),
          ];

          return SingleChildScrollView(
            child: Padding(
              padding: AppDimens.paddingAll32,
              child: Column(
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ActivityRow(
                          icon: Icons.local_fire_department_sharp,
                          iconColor:
                              Theme.of(context).brightness == Brightness.dark
                              ? AppColors.darkFire
                              : AppColors.lightFire,
                          value: '1,840',
                          label: AppLocalizations.of(context)!.calories,
                        ),
                        ActivityRow(
                          icon: Icons.directions_walk,
                          iconColor:
                              Theme.of(context).brightness == Brightness.dark
                              ? AppColors.darkSteps
                              : AppColors.lightSteps,
                          value: '3,248',
                          label: AppLocalizations.of(context)!.steps,
                        ),
                        ActivityRow(
                          icon: Icons.nights_stay,
                          iconColor:
                              Theme.of(context).brightness == Brightness.dark
                              ? AppColors.darkSleep
                              : AppColors.lightSleep,
                          value: '6.5',
                          label: AppLocalizations.of(context)!.hours,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppDimens.PADDING_200),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: healthTips.length,
                    itemBuilder: (context, index) {
                      final tip = healthTips[index];
                      return HealthTipCard(healthTip: tip);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
