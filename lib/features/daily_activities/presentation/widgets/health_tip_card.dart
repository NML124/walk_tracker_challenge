import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:walk_tracker_challenge/core/themes/app_colors.dart';
import 'package:walk_tracker_challenge/core/themes/app_diemens.dart';
import 'package:walk_tracker_challenge/features/daily_activities/domain/entities/health_tip.dart';

class HealthTipCard extends StatelessWidget {
  final HealthTip healthTip;

  final IconData icon;
  final Color iconBackgroundColor;

  const HealthTipCard({
    super.key,
    required this.healthTip,
    this.icon = Icons.local_hospital,
    this.iconBackgroundColor = Colors.purple,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Card(
      child: Padding(
        padding: AppDimens.paddingAll16,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(color: iconBackgroundColor),
              child: Icon(icon, color: Colors.white, size: 40),
            ),
            SizedBox(width: AppDimens.PADDING_28),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: width - 2 * (AppDimens.PADDING_16) - 224,
                  child: AutoSizeText(
                    healthTip.title,
                    style: TextStyle(
                      fontSize: AppDimens.FONT_SIZE_TITLE,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 2,
                  ),
                ),
                SizedBox(height: AppDimens.PADDING_8),
                Text(
                  healthTip.author,
                  style: TextStyle(
                    fontSize: AppDimens.FONT_SIZE_AUTHOR,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Spacer(),
            Icon(
              healthTip.type == HealthTipType.official
                  ? Icons.location_pin
                  : Icons.lightbulb,
              color: healthTip.type == HealthTipType.official
                  ? Colors.red
                  : Colors.amber,
              size: AppDimens.ICON_SIZE_CARD_ACTIVITY,
            ),
          ],
        ),
      ),
    );
  }
}
