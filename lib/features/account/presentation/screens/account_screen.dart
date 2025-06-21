import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/features/account/presentation/bloc/account_state.dart';
import '../bloc/account_bloc.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AccountBloc, AccountState>(
        builder: (context, state) {
          return const Center(
            child: Text('Account Screen'),
          );
        },
      ),
    );
  }
}
