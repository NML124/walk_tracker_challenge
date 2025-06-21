import 'package:flutter/material.dart';
import 'package:walk_tracker_challenge/core/themes/app_diemens.dart';

class ActivityRow extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final Color iconColor;
  const ActivityRow({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
    required this.iconColor,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppDimens.PADDING_8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Icon(
            icon,
            size: AppDimens.ICON_SIZE_ACTIVITY,
            color: iconColor,
          ),
          SizedBox(width: AppDimens.PADDING_10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                value,
                style: TextStyle(
                  fontSize: AppDimens.PADDING_20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                label,
                style: TextStyle(
                  fontSize: AppDimens.PADDING_16,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
