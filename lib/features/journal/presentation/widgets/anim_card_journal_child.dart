import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walk_tracker_challenge/core/bloc/app_settings_bloc.dart';
import 'package:walk_tracker_challenge/core/utils/format_utils.dart';
import '/core/themes/app_diemens.dart';
import '/core/themes/app_fonts.dart';

class AnimCardJournalChild extends StatefulWidget {
  const AnimCardJournalChild({super.key});

  @override
  State<AnimCardJournalChild> createState() => _AnimCardJournalChildState();
}

class _AnimCardJournalChildState extends State<AnimCardJournalChild> {
  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 24,
            color: Theme.of(context).textTheme.headlineLarge!.color,
          ),
          onPressed: () {
            setState(() {
              date = date.add(Duration(days: -1));
            });
          },
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '${date.day}',
              style: Theme.of(
                context,
              ).textTheme.headlineLarge!.copyWith(fontSize: 100),
            ),
            BlocBuilder<AppSettingsBloc, AppSettingsState>(
              builder: (context, state) {
                return Text(
                  FormatUtils.formatTimeMonthAndYear(
                    date,
                    local: state.locale.languageCode,
                  ),
                  style: TextStyle(
                    fontSize: AppDimens.FONT_SIZE_16,
                    color: Colors.grey,
                  ),
                );
              },
            ),
          ],
        ),
        if (!(date.year == DateTime.now().year &&
            date.month == DateTime.now().month &&
            date.day == DateTime.now().day))
          IconButton(
            icon: Icon(
              Icons.arrow_forward_ios_sharp,
              size: 24,
              color: Theme.of(context).textTheme.headlineLarge!.color,
            ),
            onPressed: () {
              setState(() {
                date = date.add(Duration(days: 1));
              });
            },
          ),
      ],
    );
  }
}
