import 'package:flutter/material.dart';
import 'package:walk_tracker_challenge/core/l10n/app_localizations.dart';
import 'package:walk_tracker_challenge/core/utils/format_utils.dart';
import '/core/themes/app_diemens.dart';
import '/core/themes/app_fonts.dart';

class AnimCardAccountChild extends StatelessWidget {
  const AnimCardAccountChild({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Ron",
          style: Theme.of(
            context,
          ).textTheme.headlineLarge!.copyWith(fontSize: 100),
        ),
        Text(
          "29 ${AppLocalizations.of(context)!.yearsOld}",
          style: TextStyle(
            fontSize: AppDimens.FONT_SIZE_16,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
