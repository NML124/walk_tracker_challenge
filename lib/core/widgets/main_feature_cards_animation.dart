import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:walk_tracker_challenge/core/l10n/app_localizations.dart';
import 'package:walk_tracker_challenge/core/themes/app_diemens.dart';
import 'package:walk_tracker_challenge/core/widgets/anim_card.dart';
import 'package:walk_tracker_challenge/features/account/presentation/widgets/anim_card_account_child.dart';
import 'package:walk_tracker_challenge/features/daily_activities/presentation/widgets/anim_card_daily_activities_child.dart';
import 'package:walk_tracker_challenge/features/journal/presentation/widgets/anim_card_journal_child.dart';

class MainFeatureCardsAnimation extends StatelessWidget {
  const MainFeatureCardsAnimation({super.key, required this.animValue});
  final double animValue;
  static const double maxSlideDailyActivity = 135;
  static const double maxSlideJournal = 155;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppDimens.paddingAll32,
      child: Stack(
        children: [
          // Daily Activities Card Animation
          Transform.translate(
            offset: Offset(
              -maxSlideDailyActivity * (animValue >= 1 ? 1 : animValue),
              0,
            ),
            child: Transform(
              alignment: Alignment.centerRight,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY((animValue >= 1 ? 1 : animValue) * math.pi / 2),
              child: Opacity(
                opacity:
                    1 -
                    Interval(
                      0,
                      1,
                      curve: Curves.easeOutExpo,
                    ).transform(animValue >= 1.0 ? 1.0 : animValue),
                child: AnimCard(
                  label: AppLocalizations.of(context)!.dailyGoal,
                  child: AnimCardDailyActivitiesChild(percentageAchieved: 87),
                ),
              ),
            ),
          ),
          // Journal Card Animation
          Transform.translate(
            offset: Offset(
              animValue > 1.0
                  ? maxSlideJournal * (animValue >= 2 ? 1 : 1 - animValue)
                  : maxSlideDailyActivity -
                        maxSlideDailyActivity *
                            (animValue == 1 ? 1 : animValue),
              0,
            ),
            child: Transform(
              alignment: animValue > 1.0
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(
                  animValue > 1.0
                      ? (animValue >= 2 ? 1 : 1 - animValue) * -math.pi / 2
                      : ((1 - (animValue == 1 ? 1 : animValue))) * -math.pi / 2,
                ),
              child: Opacity(
                opacity: Interval(0, 1, curve: Curves.easeInQuint).transform(
                  animValue <= 1.0
                      ? animValue
                      : animValue >= 2.0
                      ? 0
                      : 2 - animValue,
                ),
                child: AnimCard(
                  label: AppLocalizations.of(context)!.journal,
                  child: const AnimCardJournalChild(),
                ),
              ),
            ),
          ),
          // Account/Profile Card Animation
          if (animValue > 1)
            Transform.translate(
              offset: Offset(
                maxSlideJournal -
                    maxSlideJournal * (animValue >= 2 ? 1 : animValue - 1),
                0,
              ),
              child: Transform(
                alignment: Alignment.centerLeft,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY(
                    ((1 - (animValue >= 2 ? 1 : animValue - 1))) * -math.pi / 2,
                  ),
                child: Opacity(
                  opacity: Interval(
                    0,
                    1,
                    curve: Curves.easeInQuint,
                  ).transform(animValue >= 2.0 ? 1 : animValue - 1),
                  child: AnimCard(
                    label: AppLocalizations.of(context)!.profile,
                    child: AnimCardAccountChild(),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
