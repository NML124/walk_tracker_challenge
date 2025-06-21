import 'package:flutter_bloc/flutter_bloc.dart';
import 'user_auth_event.dart';
import 'user_auth_state.dart';
import '../../domain/repositories/user_auth_repository.dart';

class UserAuthBloc extends Bloc<UserAuthEvent, UserAuthState> {
  final UserAuthRepository repository;
  UserAuthBloc({required this.repository}) : super(UserAuthInitial()) {
    // Add your event handlers here
  }
}
