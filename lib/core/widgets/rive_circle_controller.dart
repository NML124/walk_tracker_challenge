import 'package:flutter/material.dart';
import 'package:rive_native/rive_native.dart' as rive;
import 'package:walk_tracker_challenge/core/widgets/rive_player.dart';

/// Controller widget for displaying and updating a Rive animated circle with three metrics (calories, steps, sleep).
///
/// This widget manages the Rive ViewModel instances for each metric and updates their color, percentage, and thickness
/// based on the provided properties. It is used to visually represent progress in a circular animation.
///
/// Parameters:
/// - [thickness]: The thickness of the animated circles.
/// - [colorSleep]: The color for the sleep metric circle.
/// - [colorSteps]: The color for the steps metric circle.
/// - [colorCalories]: The color for the calories metric circle.
/// - [percentageSleep]: The percentage value for the sleep metric.
/// - [percentageSteps]: The percentage value for the steps metric.
/// - [percentageCalories]: The percentage value for the calories metric.
/// - [init]: Callback called after the Rive file is loaded and initialized.
class RiveCircleController extends StatefulWidget {
  final double thickness;
  final Color colorSleep;
  final Color colorSteps;
  final Color colorCalories;
  final double percentageSleep;
  final double percentageSteps;
  final double percentageCalories;
  const RiveCircleController({
    super.key,
    required this.thickness,
    required this.colorSleep,
    required this.colorSteps,
    required this.colorCalories,
    required this.percentageSleep,
    required this.percentageSteps,
    required this.percentageCalories,
  });

  @override
  State<RiveCircleController> createState() => _RiveCircleControllerState();
}

class _RiveCircleControllerState extends State<RiveCircleController> {
  rive.ViewModelInstance? _calorieVM;
  rive.ViewModelInstance? _stepVM;
  rive.ViewModelInstance? _sleepVM;

  rive.ViewModelInstanceColor? _calorieColor;
  rive.ViewModelInstanceColor? _stepColor;
  rive.ViewModelInstanceColor? _sleepColor;
  rive.ViewModelInstanceNumber? _caloriePercent;
  rive.ViewModelInstanceNumber? _stepPercent;
  rive.ViewModelInstanceNumber? _sleepPercent;
  rive.ViewModelInstanceNumber? _calorieThickness;
  rive.ViewModelInstanceNumber? _stepThickness;
  rive.ViewModelInstanceNumber? _sleepThickness;

  bool get _isInitialized =>
      _calorieVM != null && _stepVM != null && _sleepVM != null;

  @override
  void dispose() {
    // Dispose Rive ViewModel instances to free resources
    _calorieVM?.dispose();
    _stepVM?.dispose();
    _sleepVM?.dispose();
    super.dispose();
  }

  void _updateRiveValues() {
    if (!_isInitialized) return;
    _caloriePercent?.value = widget.percentageCalories;
    _stepPercent?.value = widget.percentageSteps;
    _sleepPercent?.value = widget.percentageSleep;
    _calorieThickness?.value = widget.thickness;
    _stepThickness?.value = widget.thickness;
    _sleepThickness?.value = widget.thickness;
    _calorieColor?.value = widget.colorCalories;
    _stepColor?.value = widget.colorSteps;
    _sleepColor?.value = widget.colorSleep;
  }

  @override
  void didUpdateWidget(covariant RiveCircleController oldWidget) {
    super.didUpdateWidget(oldWidget);
    _updateRiveValues();
  }

  @override
  Widget build(BuildContext context) {
    return RivePlayer(
      asset: "assets/rive/circle.riv",
      autoBind: true,
      fit: rive.Fit.contain,
      alignment: Alignment.bottomCenter,
      layoutScaleFactor: 1 / 2.0,
      withViewModelInstance: (viewModelInstance) {
        _calorieVM = viewModelInstance.viewModel("calorie");
        _stepVM = viewModelInstance.viewModel("step");
        _sleepVM = viewModelInstance.viewModel("sleep");

        _caloriePercent = _calorieVM?.number("percentage");
        _stepPercent = _stepVM?.number("percentage");
        _sleepPercent = _sleepVM?.number("percentage");

        _calorieColor = _calorieVM?.color("color");
        _stepColor = _stepVM?.color("color");
        _sleepColor = _sleepVM?.color("color");

        _calorieThickness = _calorieVM?.number("thickness");
        _stepThickness = _stepVM?.number("thickness");
        _sleepThickness = _sleepVM?.number("thickness");

        _updateRiveValues();
      },
    );
  }
}
