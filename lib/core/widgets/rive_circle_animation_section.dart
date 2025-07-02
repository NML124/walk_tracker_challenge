import 'package:flutter/material.dart';
import 'package:walk_tracker_challenge/core/themes/app_colors.dart';
import 'package:walk_tracker_challenge/core/themes/app_diemens.dart';
import 'package:walk_tracker_challenge/core/widgets/rive_circle_controller.dart';

class RiveCircleAnimationSection extends StatelessWidget {
  final double value;
  final double width;
  final double height;
  const RiveCircleAnimationSection({
    super.key,
    required this.value,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(
        (width / 2) - AppDimens.PADDING_32,
        (height * 3 / 4) - AppDimens.PADDING_32 - 200,
      ),
      child: SizedBox(
        width: width / 2,
        height: 200,
        child: RiveCircleController(
          thickness: (value >= 1) ? 0 : 15 - (value * 15),
          colorSleep: Theme.of(context).brightness == Brightness.dark
              ? AppColors.darkSleep
              : AppColors.lightSleep,
          colorSteps: Theme.of(context).brightness == Brightness.dark
              ? AppColors.darkSteps
              : AppColors.lightSteps,
          colorCalories: Theme.of(context).brightness == Brightness.dark
              ? AppColors.darkFire
              : AppColors.lightFire,
          percentageSleep: 60 - (value * 20),
          percentageSteps: 65 - (value * 20),
          percentageCalories: 70 - (value * 20),
          init: () {},
        ),
      ),
    );
  }
}
