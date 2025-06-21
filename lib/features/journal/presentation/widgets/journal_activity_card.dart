import 'package:flutter/material.dart';
import '/core/themes/app_diemens.dart';
import '/features/journal/domain/entities/journal_activity.dart';
import '/core/l10n/app_localizations.dart';
import '/core/utils/format_utils.dart';

class JournalActivityCard extends StatelessWidget {
  const JournalActivityCard({super.key, required this.activity});
  final JournalActivity activity;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: AppDimens.paddingAll16,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(width: 60, height: 70, color: Colors.blue),
            const SizedBox(width: AppDimens.SPACING_16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    FormatUtils.formatTimeHourAndMinute(activity.date),
                    style: const TextStyle(
                      fontSize: AppDimens.FONT_SIZE_16,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    activity.activityPeriod == ActivityPeriod.morning
                        ? AppLocalizations.of(context)!.morningWalk
                        : activity.activityPeriod == ActivityPeriod.afternoon
                        ? AppLocalizations.of(context)!.afternoonWalk
                        : AppLocalizations.of(context)!.eveningWalk,
                    style: const TextStyle(
                      fontSize: AppDimens.FONT_SIZE_20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    AppLocalizations.of(context)!.walkDistanceTime(
                      activity.distance,
                      activity.duration.inMinutes,
                    ),
                    style: const TextStyle(
                      fontSize: AppDimens.FONT_SIZE_16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            // Icon
            const Icon(Icons.directions_walk, color: Colors.orange),
          ],
        ),
      ),
    );
  }
}
