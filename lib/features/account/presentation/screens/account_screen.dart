import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/l10n/app_localizations.dart';
import '/features/account/presentation/bloc/account_state.dart';
import '../bloc/account_bloc.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AccountBloc, AccountState>(
        builder: (context, state) {
          return  Center(
            child: Text(AppLocalizations.of(context)!.profile),
          );
        },
      ),
    );
  }
}
