import 'package:flutter/material.dart';
import 'package:o3d/o3d.dart';
import 'package:walk_tracker_challenge/core/themes/app_diemens.dart';

/// Animated 3D character widget that responds to scroll position.
class AnimPerso extends StatefulWidget {
  const AnimPerso({
    super.key,
    required this.animationScrollX,
    required this.width,
    required this.height,
  });

  final double animationScrollX;
  final double width;
  final double height;

  @override
  State<AnimPerso> createState() => _AnimPersoState();
}

class _AnimPersoState extends State<AnimPerso> {
  final O3DController _controller = O3DController();

  @override
  void didUpdateWidget(covariant AnimPerso oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Determine current page from scroll position
    final int currentPage = widget.animationScrollX.round().clamp(0, 2);
    // Animation name based on page
    _controller.animationName = _getAnimationName(currentPage);
    // Camera orbit and target based on scroll
    final cameraOrbit = _calculateCameraOrbit(widget.animationScrollX);
    final cameraTarget = _calculateCameraTarget(widget.animationScrollX);
    _controller.cameraOrbit(cameraOrbit[0], cameraOrbit[1], cameraOrbit[2]);
    _controller.cameraTarget(cameraTarget[0], cameraTarget[1], cameraTarget[2]);
  }

  String _getAnimationName(int page) {
    switch (page) {
      case 0:
        return "WalkCycle";
      case 1:
        return "KLIENT.ARMATURE.001Action";
      case 2:
        return "WalkCycle";
      default:
        return "WalkCycle";
    }
  }

  List<double> _calculateCameraOrbit(double scrollX) {
    final double clampedScroll = scrollX.clamp(0, 2);
    final double x =
        180 -
        90 * (clampedScroll <= 1 ? clampedScroll : 1) +
        90 * (clampedScroll > 1 ? (clampedScroll - 1) : 0);
    final double y = 65 + ((clampedScroll <= 1) ? 25 * clampedScroll : 25);
    final double z = 100 - 50 * (clampedScroll > 1 ? (clampedScroll - 1) : 0);
    return [x, y, z];
  }

  List<double> _calculateCameraTarget(double scrollX) {
    final double clampedScroll = scrollX.clamp(0, 2);
    final double y = 5 - 2 * (clampedScroll > 1 ? (clampedScroll - 1) : 0);
    return [0, y, 0];
  }

  @override
  Widget build(BuildContext context) {
    // Calculate offsets for translation
    final double clampedScroll = widget.animationScrollX.clamp(0, 2);
    final double xOffset =
        (widget.width / 2) -
        AppDimens.PADDING_32 -
        100 * (clampedScroll <= 1 ? clampedScroll : 1) -
        13 * (clampedScroll > 1 ? (clampedScroll - 1) : 0);
    final double yOffset =
        (widget.height * 3 / 4) -
        AppDimens.PADDING_32 -
        400 -
        50 * (clampedScroll > 1 ? (clampedScroll - 1) : 0);
    final double boxWidth =
        200 + (clampedScroll <= 1 ? 100 * clampedScroll : 100);

    // Determine current page for animationName
    final int currentPage = widget.animationScrollX.round().clamp(0, 2);

    return Transform.translate(
      offset: Offset(xOffset, yOffset),
      child: SizedBox(
        width: boxWidth,
        height: 350,
        child: O3D(
          src: "assets/anim/anim.glb",
          controller: _controller,
          autoRotate: false,
          animationName: _getAnimationName(currentPage),
          autoPlay: true,
          cameraControls: false,
          cameraTarget: CameraTarget(0, 5, 0),
          cameraOrbit: CameraOrbit(180, 65, 75),
        ),
      ),
    );
  }
}
