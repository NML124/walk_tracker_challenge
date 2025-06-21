import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walk_tracker_challenge/core/themes/app_diemens.dart';
import 'package:walk_tracker_challenge/core/utils/format_utils.dart';
import '/core/themes/app_colors.dart';
import '/features/account/presentation/widgets/daily_goal_card.dart';
import '/core/l10n/app_localizations.dart';
import '/features/account/presentation/bloc/account_state.dart';
import '../bloc/account_bloc.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: BlocBuilder<AccountBloc, AccountState>(
        builder: (context, state) {
          return Padding(
            padding: AppDimens.paddingAll32,
            child: Column(
              spacing: AppDimens.SPACING_32,
              children: [
                Spacer(),
                Container(
                  width: width - 200,
                  height: width - 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                    border: Border.all(
                      color: Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.2),
                      width: 4,
                    ),
                  ),
                ),
                Text(
                  FormatUtils.capitalizeFirst(
                    AppLocalizations.of(context)!.dailyGoals,
                  ),
                  style: TextStyle(fontSize: AppDimens.FONT_SIZE_20),
                ),
                Column(
                  spacing: AppDimens.SPACING_12,
                  children: [
                    DailyGoalCard(
                      icon: Icons.local_fire_department_sharp,
                      label: FormatUtils.capitalizeFirst(
                        AppLocalizations.of(context)!.calories,
                      ),
                      value: "2,000",
                      color: Theme.of(context).brightness == Brightness.dark
                          ? AppColors.darkFire
                          : AppColors.lightFire,
                    ),
                    DailyGoalCard(
                      icon: Icons.directions_walk,
                      label: FormatUtils.capitalizeFirst(
                        AppLocalizations.of(context)!.steps,
                      ),
                      value: "3,500",
                      color: Theme.of(context).brightness == Brightness.dark
                          ? AppColors.darkSteps
                          : AppColors.lightSteps,
                    ),
                    DailyGoalCard(
                      icon: Icons.nights_stay,
                      label: FormatUtils.capitalizeFirst(
                        AppLocalizations.of(context)!.sleep,
                      ),
                      value: "8h",
                      color: Theme.of(context).brightness == Brightness.dark
                          ? AppColors.darkSleep
                          : AppColors.lightSleep,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
