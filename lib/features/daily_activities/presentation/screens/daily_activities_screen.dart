import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walk_tracker_challenge/core/themes/app_colors.dart';
import 'package:walk_tracker_challenge/core/themes/app_diemens.dart';
import 'package:walk_tracker_challenge/features/daily_activities/domain/entities/health_tip.dart';
import 'package:walk_tracker_challenge/features/daily_activities/presentation/widgets/activity_row.dart';
import 'package:walk_tracker_challenge/features/daily_activities/presentation/widgets/health_tip_card.dart';
import 'package:walk_tracker_challenge/core/l10n/app_localizations.dart';
import 'package:walk_tracker_challenge/features/daily_activities/presentation/bloc/daily_activities_state.dart';
import 'package:walk_tracker_challenge/features/daily_activities/presentation/bloc/daily_activities_bloc.dart';

/// Main screen for displaying daily activities and health tips.
class DailyActivitiesScreen extends StatelessWidget {
  const DailyActivitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final fireColor = isDark ? AppColors.darkFire : AppColors.lightFire;
    final stepsColor = isDark ? AppColors.darkSteps : AppColors.lightSteps;
    final sleepColor = isDark ? AppColors.darkSleep : AppColors.lightSleep;

    return BlocBuilder<DailyActivitiesBloc, DailyActivitiesState>(
      builder: (context, state) {
        // Example list of health tips (replace with real data in production)
        final healthTips = [
          HealthTip(
            title: 'A simple way to stay healthy',
            author: 'Dr Melissa',
          ),
          HealthTip(title: 'Drink more water', author: 'Dr John'),
          HealthTip(title: 'Exercise regularly', author: 'Dr Smith'),
          HealthTip(
            title: 'Take breaks during work',
            author: 'Dr Smith',
            type: HealthTipType.unofficial,
          ),
        ];

        return Padding(
          padding: const EdgeInsets.only(
            top: AppDimens.PADDING_32,
            left: AppDimens.PADDING_32,
            right: AppDimens.PADDING_32,
          ),
          child: Stack(
            children: [
              // Health tips list
              Column(
                children: [
                  SizedBox(height: (height * 3 / 4) - AppDimens.PADDING_32),
                  Expanded(
                    child: ListView.builder(
                      itemCount: healthTips.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return HealthTipCard(healthTip: healthTips[index]);
                      },
                    ),
                  ),
                ],
              ),
              // Activity summary overlay
              Column(
                children: [
                  SizedBox(height: (height / 4)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ActivityRow(
                        icon: Icons.local_fire_department_sharp,
                        iconColor: fireColor,
                        value: '1,840',
                        label: AppLocalizations.of(context)!.calories,
                      ),
                      ActivityRow(
                        icon: Icons.directions_walk,
                        iconColor: stepsColor,
                        value: '3,248',
                        label: AppLocalizations.of(context)!.steps,
                      ),
                      ActivityRow(
                        icon: Icons.nights_stay,
                        iconColor: sleepColor,
                        value: '6.5',
                        label: AppLocalizations.of(context)!.hours,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
