import 'package:flutter/material.dart';
import 'package:rive_native/rive_native.dart' as rive;
import 'package:walk_tracker_challenge/core/widgets/rive_player.dart';

class RiveCircleController extends StatefulWidget {
  final double thickness;
  final Color colorSleep;
  final Color colorSteps;
  final Color colorCalories;
  final double percentageSleep;
  final double percentageSteps;
  final double percentageCalories;
  final VoidCallback init;
  const RiveCircleController({
    super.key,
    required this.thickness,
    required this.colorSleep,
    required this.colorSteps,
    required this.colorCalories,
    required this.percentageSleep,
    required this.percentageSteps,
    required this.percentageCalories,
    required this.init,
  });

  @override
  State<RiveCircleController> createState() => _RiveCircleControllerState();
}

class _RiveCircleControllerState extends State<RiveCircleController> {
  late rive.ViewModelInstance viewModelInstance;
  late rive.ViewModelInstance calorieVM;
  late rive.ViewModelInstance stepVM;
  late rive.ViewModelInstance sleepVM;
  late rive.ViewModelInstanceColor calorieColor;
  late rive.ViewModelInstanceColor stepColor;
  late rive.ViewModelInstanceColor sleepColor;
  late rive.ViewModelInstanceNumber caloriePercent;
  late rive.ViewModelInstanceNumber stepPercent;
  late rive.ViewModelInstanceNumber sleepPercent;
  late rive.ViewModelInstanceNumber calorieThickness;
  late rive.ViewModelInstanceNumber stepThickness;
  late rive.ViewModelInstanceNumber sleepThickness;
  bool fileLoad = false;

  @override
  void dispose() {
    calorieVM.dispose();
    stepVM.dispose();
    sleepVM.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant RiveCircleController oldWidget) {
    if (fileLoad) {
      caloriePercent.value = widget.percentageCalories;
      stepPercent.value = widget.percentageSteps;
      sleepPercent.value = widget.percentageSleep;

      calorieThickness.value = widget.thickness;
      stepThickness.value = widget.thickness;
      sleepThickness.value = widget.thickness;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    print("champions");
    return RivePlayer(
      asset: "assets/rive/circle.riv",
      autoBind: true,
      fit: rive.Fit.contain,
      alignment: Alignment.bottomCenter,
      layoutScaleFactor: 1 / 2.0,
      withViewModelInstance: (viewModelInstance) {
        this.viewModelInstance = viewModelInstance;
        calorieVM = viewModelInstance.viewModel("calorie")!;
        stepVM = viewModelInstance.viewModel("step")!;
        sleepVM = viewModelInstance.viewModel("sleep")!;

        caloriePercent = calorieVM.number("percentage")!;
        stepPercent = stepVM.number("percentage")!;
        sleepPercent = sleepVM.number("percentage")!;

        calorieColor = calorieVM.color("color")!;
        stepColor = stepVM.color("color")!;
        sleepColor = sleepVM.color("color")!;

        calorieThickness = calorieVM.number("thickness")!;
        stepThickness = stepVM.number("thickness")!;
        sleepThickness = sleepVM.number("thickness")!;

        caloriePercent.value = 50;
        stepPercent.value = 50;
        sleepPercent.value = 50;

        calorieColor.value = widget.colorCalories;
        stepColor.value = widget.colorSteps;
        sleepColor.value = widget.colorSleep;

        calorieThickness.value = widget.thickness;
        stepThickness.value = widget.thickness;
        sleepThickness.value = widget.thickness;

        fileLoad = true;
        widget.init.call();
      },
    );
  }
}
