import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walk_tracker_challenge/core/themes/app_diemens.dart';
import 'package:walk_tracker_challenge/core/utils/format_utils.dart';
import '/core/themes/app_colors.dart';
import '/features/account/presentation/widgets/daily_goal_card.dart';
import '/core/l10n/app_localizations.dart';
import '/features/account/presentation/bloc/account_state.dart';
import '../bloc/account_bloc.dart';
import 'package:walk_tracker_challenge/core/widgets/circle_clipper.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: BlocBuilder<AccountBloc, AccountState>(
        builder: (context, state) {
          return ClipPath(
            clipper: CircleClipper(),
            child: Container(
              color: Colors.white,
              padding: EdgeInsetsGeometry.only(
                top: AppDimens.PADDING_32,
                left: AppDimens.PADDING_32,
                right: AppDimens.PADDING_32,
              ),
              child: Column(
                children: [
                  Container(height: height * 2 / 5 + width * 0.35),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        spacing: AppDimens.SPACING_12,
                        children: [
                          Text(
                            FormatUtils.capitalizeFirst(
                              AppLocalizations.of(context)!.dailyGoals,
                            ),
                            style: TextStyle(fontSize: AppDimens.FONT_SIZE_20),
                          ),
                          DailyGoalCard(
                            icon: Icons.local_fire_department_sharp,
                            label: FormatUtils.capitalizeFirst(
                              AppLocalizations.of(context)!.calories,
                            ),
                            value: "2,000",
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                ? AppColors.darkFire
                                : AppColors.lightFire,
                          ),
                          DailyGoalCard(
                            icon: Icons.directions_walk,
                            label: FormatUtils.capitalizeFirst(
                              AppLocalizations.of(context)!.steps,
                            ),
                            value: "3,500",
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                ? AppColors.darkSteps
                                : AppColors.lightSteps,
                          ),
                          DailyGoalCard(
                            icon: Icons.nights_stay,
                            label: FormatUtils.capitalizeFirst(
                              AppLocalizations.of(context)!.sleep,
                            ),
                            value: "8h",
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                ? AppColors.darkSleep
                                : AppColors.lightSleep,
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
      ),
    );
  }
}
