import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walk_tracker_challenge/core/l10n/app_localizations.dart';
import '/features/user_auth/presentation/bloc/user_auth_state.dart';
import '../bloc/user_auth_bloc.dart';

class UserAuthScreen extends StatelessWidget {
  const UserAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserAuthBloc, UserAuthState>(
        builder: (context, state) {
          return Center(child: Text(AppLocalizations.of(context)!.login));
        },
      ),
    );
  }
}
