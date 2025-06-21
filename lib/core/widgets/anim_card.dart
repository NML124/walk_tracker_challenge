import 'package:flutter/material.dart';
import 'package:walk_tracker_challenge/core/themes/app_diemens.dart';
import 'package:walk_tracker_challenge/core/themes/app_fonts.dart';

class AnimCard extends StatefulWidget {
  const AnimCard({super.key, required this.label, required this.child});
  final String label;
  final Widget child;
  @override
  State<AnimCard> createState() => _AnimCardState();
}

class _AnimCardState extends State<AnimCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.label.toUpperCase(),
          style: AppFonts.bold.copyWith(fontSize: AppDimens.FONT_SIZE_24),
        ),
        widget.child,
      ],
    );
  }
}
