import 'package:flutter_bloc/flutter_bloc.dart';
import 'journal_event.dart';
import 'journal_state.dart';
import '../../domain/repositories/journal_repository.dart';

class JournalBloc extends Bloc<JournalEvent, JournalState> {
  final JournalRepository repository;
  JournalBloc({required this.repository}) : super(JournalInitial()) {
    // Add your event handlers here
  }
}
