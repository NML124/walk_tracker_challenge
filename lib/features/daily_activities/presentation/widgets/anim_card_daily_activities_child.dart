import 'package:flutter/material.dart';
import '/core/themes/app_diemens.dart';
import '/core/themes/app_fonts.dart';

class AnimCardDailyActivitiesChild extends StatelessWidget {
  const AnimCardDailyActivitiesChild({
    super.key,
    required this.percentageAchieved,
  });
  final int percentageAchieved;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          percentageAchieved.toString(),
          style: Theme.of(
            context,
          ).textTheme.headlineLarge!.copyWith(fontSize: 100),
        ),
        Text(
          "%",
          style: AppFonts.bold.copyWith(fontSize: AppDimens.FONT_SIZE_24),
        ),
      ],
    );
  }
}
