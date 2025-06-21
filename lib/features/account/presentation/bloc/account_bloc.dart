import 'package:flutter_bloc/flutter_bloc.dart';
import 'account_event.dart';
import 'account_state.dart';
import '../../domain/repositories/account_repository.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final AccountRepository repository;
  AccountBloc({required this.repository}) : super(AccountInitial()) {
    // Add your event handlers here
  }
}
