import 'package:flutter/material.dart';
import 'package:o3d/o3d.dart';
import 'package:walk_tracker_challenge/core/themes/app_diemens.dart';

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
  O3DController controller = O3DController();
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(
        (widget.width / 2) - AppDimens.PADDING_32,
        (widget.height * 3 / 4) - AppDimens.PADDING_32 - 400,
      ), // 50 -560
      child: Container(
        width: widget.width / 2,
        height: 400,
        child: O3D(
          src: "assets/anim/anim.glb",
          controller: controller,
          autoRotate: false,
          animationName: "WalkCycle",
          autoPlay: true,
          cameraControls: false,

          cameraTarget: CameraTarget(0, 1.5, 1.5), //0 1.5 1.5   1.5 0 0
          cameraOrbit: CameraOrbit(180, 65, 1), //180,65,1     90 90 1
        ),
      ),
    );
  }
}
