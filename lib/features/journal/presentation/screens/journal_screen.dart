import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/l10n/app_localizations.dart';
import '../bloc/journal_state.dart';
import '../bloc/journal_bloc.dart';

class JournalScreen extends StatelessWidget {
  const JournalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<JournalBloc, JournalState>(
        builder: (context, state) {
          return  Center(
            child: Text(AppLocalizations.of(context)!.journal),
          );
        },
      ),
    );
  }
}
