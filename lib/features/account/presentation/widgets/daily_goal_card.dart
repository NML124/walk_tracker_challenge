import 'package:flutter/material.dart';
import 'package:walk_tracker_challenge/core/themes/app_diemens.dart';

class DailyGoalCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const DailyGoalCard({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    this.color = Colors.orange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimens.PADDING_16,
        vertical: AppDimens.PADDING_8,
      ),
      decoration: BoxDecoration(
        color: color,

        borderRadius: BorderRadius.circular(AppDimens.BORDER_RADIUS_12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: AppDimens.ICON_SIZE_DAILY_GOALS,
              ),
              const SizedBox(width: AppDimens.SPACING_8),
              Text(
                label,
                style: const TextStyle(
                  fontSize: AppDimens.FONT_SIZE_20,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: AppDimens.FONT_SIZE_20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
