import 'package:flutter/material.dart';
import 'package:o3d/o3d.dart';
import 'package:walk_tracker_challenge/core/themes/app_diemens.dart';

class AnimPerso extends StatefulWidget {
  const AnimPerso({
    super.key,
    required this.animationScrollX,
    required this.width,
    required this.height,
    required this.page,
  });
  final double animationScrollX;
  final double width;
  final double height;
  final int page;
  @override
  State<AnimPerso> createState() => _AnimPersoState();
}

class _AnimPersoState extends State<AnimPerso> {
  O3DController controller = O3DController();

  @override
  void didUpdateWidget(covariant AnimPerso oldWidget) {
    controller.animationName = widget.page == 0 || widget.page == 2
        ? "WalkCycle"
        : "KLIENT.ARMATURE.001Action";
    controller.cameraOrbit(
      180 -
          90 * (widget.animationScrollX <= 1 ? widget.animationScrollX : 1) +
          90 *
              (widget.animationScrollX > 1 && widget.animationScrollX <= 2
                  ? (widget.animationScrollX - 1)
                  : 0),
      65 +
          ((widget.animationScrollX <= 1)
              ? 25 * (widget.animationScrollX)
              : 25),
      100 -
          50 *
              (widget.animationScrollX > 1 && widget.animationScrollX <= 2
                  ? (widget.animationScrollX - 1)
                  : 0),
    );
    controller.cameraTarget(
      0,
      5 -
          2 *
              (widget.animationScrollX > 1 && widget.animationScrollX <= 2
                  ? (widget.animationScrollX - 1)
                  : 0),
      0,
    );

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(
        (widget.width / 2) -
            AppDimens.PADDING_32 -
            100 *
                ((widget.animationScrollX <= 1) ? widget.animationScrollX : 1) -
            13 *
                (widget.animationScrollX > 1 && widget.animationScrollX <= 2
                    ? (widget.animationScrollX - 1)
                    : 0),
        (widget.height * 3 / 4) -
            AppDimens.PADDING_32 -
            400 -
            50 *
                (widget.animationScrollX > 1 && widget.animationScrollX <= 2
                    ? (widget.animationScrollX - 1)
                    : 0),
      ), // 0,400  100 300
      child: SizedBox(
        width:
            200 +
            ((widget.animationScrollX <= 1)
                ? 100 * widget.animationScrollX
                : 100) -
            0 *
                (widget.animationScrollX > 1 && widget.animationScrollX <= 2
                    ? (widget.animationScrollX - 1)
                    : 0), // 0   50
        height: 350,
        child: O3D(
          // backgroundColor: Colors.amber,
          src: "assets/anim/anim.glb",
          controller: controller,
          autoRotate: false,
          animationName: widget.page == 0
              ? "WalkCycle"
              : widget.page == 1
              ? "KLIENT.ARMATURE.001Action"
              : "Kickflip.008",
          autoPlay: true,
          cameraControls: false,
          cameraTarget: CameraTarget(0, 5, 0), //0 5 0
          cameraOrbit: CameraOrbit(180, 65, 75), //180,65,1     90 90 1
        ),
      ),
    );
  }
}
