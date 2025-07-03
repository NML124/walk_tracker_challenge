import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walk_tracker_challenge/core/themes/app_diemens.dart';
import 'package:walk_tracker_challenge/core/utils/format_utils.dart';
import 'package:walk_tracker_challenge/core/themes/app_colors.dart';
import 'package:walk_tracker_challenge/features/account/presentation/widgets/daily_goal_card.dart';
import 'package:walk_tracker_challenge/core/l10n/app_localizations.dart';
import 'package:walk_tracker_challenge/features/account/presentation/bloc/account_state.dart';
import 'package:walk_tracker_challenge/features/account/presentation/bloc/account_bloc.dart';
import 'package:walk_tracker_challenge/core/widgets/circle_clipper.dart';

/// Account screen showing daily goals and user summary.
class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final double height = MediaQuery.sizeOf(context).height;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final fireColor = isDark ? AppColors.darkFire : AppColors.lightFire;
    final stepsColor = isDark ? AppColors.darkSteps : AppColors.lightSteps;
    final sleepColor = isDark ? AppColors.darkSleep : AppColors.lightSleep;

    return BlocBuilder<AccountBloc, AccountState>(
      builder: (context, state) {
        return ClipPath(
          clipper: CircleClipper(),
          child: Container(
            color: theme.bottomNavigationBarTheme.backgroundColor,
            padding: const EdgeInsets.only(
              top: AppDimens.PADDING_32,
              left: AppDimens.PADDING_32,
              right: AppDimens.PADDING_32,
            ),
            child: Column(
              children: [
                SizedBox(height: height * 2 / 5 + width * 0.35),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          FormatUtils.capitalizeFirst(
                            AppLocalizations.of(context)!.dailyGoals,
                          ),
                          style: const TextStyle(
                            fontSize: AppDimens.FONT_SIZE_20,
                          ),
                        ),
                        const SizedBox(height: AppDimens.SPACING_12),
                        DailyGoalCard(
                          icon: Icons.local_fire_department_sharp,
                          label: FormatUtils.capitalizeFirst(
                            AppLocalizations.of(context)!.calories,
                          ),
                          value: "2,000",
                          color: fireColor,
                        ),
                        const SizedBox(height: AppDimens.SPACING_12),
                        DailyGoalCard(
                          icon: Icons.directions_walk,
                          label: FormatUtils.capitalizeFirst(
                            AppLocalizations.of(context)!.steps,
                          ),
                          value: "3,500",
                          color: stepsColor,
                        ),
                        const SizedBox(height: AppDimens.SPACING_12),
                        DailyGoalCard(
                          icon: Icons.nights_stay,
                          label: FormatUtils.capitalizeFirst(
                            AppLocalizations.of(context)!.sleep,
                          ),
                          value: "8h",
                          color: sleepColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
