import 'package:flutter/material.dart';
import '/core/themes/app_diemens.dart';

class CircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) => Path()
    ..addOval(
      Rect.fromCircle(
        center: Offset(
          size.width / 2,
          size.height * 2 / 5 + AppDimens.PADDING_32,
        ),
        radius: size.width * 0.35,
      ),
    )
    ..addRect(Rect.fromLTRB(0, 0, size.width, size.height))
    ..fillType = PathFillType.evenOdd;

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
