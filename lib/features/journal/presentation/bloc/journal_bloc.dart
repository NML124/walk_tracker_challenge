import 'package:flutter_bloc/flutter_bloc.dart';
import 'journal_event.dart';
import 'journal_state.dart';

class JournalBloc extends Bloc<JournalEvent, JournalState> {
  JournalBloc() : super(JournalInitial()) {
    // Add your event handlers here
  }
}
