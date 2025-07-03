import 'package:flutter/material.dart';
import 'package:walk_tracker_challenge/core/themes/app_colors.dart';
import 'package:walk_tracker_challenge/core/themes/app_diemens.dart';
import 'package:walk_tracker_challenge/core/widgets/rive_circle_controller.dart';

/// Displays the animated Rive circle section with progress indicators for sleep, steps, and calories.
///
/// [value] controls the animation progress (0.0 to 1.0).
/// [width] and [height] are the available screen dimensions.
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
    // Calculate offsets and sizes for positioning
    final double xOffset = (width / 2) - AppDimens.PADDING_32;
    final double yOffset = (height * 3 / 4) - AppDimens.PADDING_32 - 200;
    final double circleWidth = width / 2;
    const double circleHeight = 200;

    // Theme-based colors
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final sleepColor = isDark ? AppColors.darkSleep : AppColors.lightSleep;
    final stepsColor = isDark ? AppColors.darkSteps : AppColors.lightSteps;
    final caloriesColor = isDark ? AppColors.darkFire : AppColors.lightFire;

    // Animated values
    final double thickness = (value >= 1) ? 0 : 15 - (value * 15);
    final double percentageSleep = 60 - (value * 20);
    final double percentageSteps = 65 - (value * 20);
    final double percentageCalories = 70 - (value * 20);

    return Transform.translate(
      offset: Offset(xOffset, yOffset),
      child: SizedBox(
        width: circleWidth,
        height: circleHeight,
        child: RiveCircleController(
          thickness: thickness,
          colorSleep: sleepColor,
          colorSteps: stepsColor,
          colorCalories: caloriesColor,
          percentageSleep: percentageSleep,
          percentageSteps: percentageSteps,
          percentageCalories: percentageCalories,
        ),
      ),
    );
  }
}
