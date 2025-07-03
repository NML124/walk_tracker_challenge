import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:walk_tracker_challenge/core/l10n/app_localizations.dart';
import 'package:walk_tracker_challenge/core/themes/app_diemens.dart';
import 'package:walk_tracker_challenge/core/widgets/anim_card.dart';
import 'package:walk_tracker_challenge/features/account/presentation/widgets/anim_card_account_child.dart';
import 'package:walk_tracker_challenge/features/daily_activities/presentation/widgets/anim_card_daily_activities_child.dart';
import 'package:walk_tracker_challenge/features/journal/presentation/widgets/anim_card_journal_child.dart';

/// Animated stack of feature cards for main screen navigation.
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
          _buildDailyActivitiesCard(context),
          _buildJournalCard(context),
          if (animValue > 1) _buildAccountCard(context),
        ],
      ),
    );
  }

  Widget _buildDailyActivitiesCard(BuildContext context) {
    final double slide = -maxSlideDailyActivity * animValue.clamp(0, 1);
    final double rotation = animValue.clamp(0, 1) * math.pi / 2;
    final double opacity =
        1 -
        Interval(
          0,
          1,
          curve: Curves.easeOutExpo,
        ).transform(animValue.clamp(0, 1));
    return Transform.translate(
      offset: Offset(slide, 0),
      child: Transform(
        alignment: Alignment.centerRight,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateY(rotation),
        child: Opacity(
          opacity: opacity,
          child: AnimCard(
            label: AppLocalizations.of(context)!.dailyGoal,
            child: const AnimCardDailyActivitiesChild(percentageAchieved: 87),
          ),
        ),
      ),
    );
  }

  Widget _buildJournalCard(BuildContext context) {
    final bool isSecondPage = animValue > 1.0;
    final double slide = isSecondPage
        ? maxSlideJournal * (animValue >= 2 ? 1 : 1 - animValue)
        : maxSlideDailyActivity - maxSlideDailyActivity * animValue.clamp(0, 1);
    final Alignment alignment = isSecondPage
        ? Alignment.centerRight
        : Alignment.centerLeft;
    final double rotation = isSecondPage
        ? (animValue >= 2 ? 1 : 1 - animValue) * -math.pi / 2
        : (1 - animValue.clamp(0, 1)) * -math.pi / 2;
    final double opacity = Interval(0, 1, curve: Curves.easeInQuint).transform(
      animValue <= 1.0
          ? animValue
          : animValue >= 2.0
          ? 0
          : 2 - animValue,
    );
    return Transform.translate(
      offset: Offset(slide, 0),
      child: Transform(
        alignment: alignment,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateY(rotation),
        child: Opacity(
          opacity: opacity,
          child: AnimCard(
            label: AppLocalizations.of(context)!.journal,
            child: const AnimCardJournalChild(),
          ),
        ),
      ),
    );
  }

  Widget _buildAccountCard(BuildContext context) {
    final double clampedAnim = (animValue > 1 ? animValue - 1 : 0)
        .clamp(0, 1)
        .toDouble();
    final double slide = maxSlideJournal - maxSlideJournal * clampedAnim;
    final double rotation = (1 - clampedAnim) * -math.pi / 2;
    final double opacity = Interval(
      0,
      1,
      curve: Curves.easeInQuint,
    ).transform(clampedAnim);
    return Transform.translate(
      offset: Offset(slide, 0),
      child: Transform(
        alignment: Alignment.centerLeft,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateY(rotation),
        child: Opacity(
          opacity: opacity,
          child: AnimCard(
            label: AppLocalizations.of(context)!.profile,
            child: const AnimCardAccountChild(),
          ),
        ),
      ),
    );
  }
}
