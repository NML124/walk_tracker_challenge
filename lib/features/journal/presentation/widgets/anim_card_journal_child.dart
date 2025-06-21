import 'package:flutter/material.dart';
import 'package:walk_tracker_challenge/core/utils/format_utils.dart';
import '/core/themes/app_diemens.dart';
import '/core/themes/app_fonts.dart';

class AnimCardJournalChild extends StatelessWidget {
  const AnimCardJournalChild({super.key, required this.date});
  final DateTime date;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 24,
            color: Theme.of(context).textTheme.headlineLarge!.color,
          ),
          onPressed: () => (),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '${date.day}',
              style: Theme.of(
                context,
              ).textTheme.headlineLarge!.copyWith(fontSize: 100),
            ),
            Text(
              FormatUtils.formatTimeMonthAndYear(date),
              style: TextStyle(
                fontSize: AppDimens.FONT_SIZE_16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
