import 'package:flutter_bloc/flutter_bloc.dart';
import 'user_auth_event.dart';
import 'user_auth_state.dart';

class UserAuthBloc extends Bloc<UserAuthEvent, UserAuthState> {
  UserAuthBloc() : super(UserAuthInitial()) {
    // Add your event handlers here
  }
}
