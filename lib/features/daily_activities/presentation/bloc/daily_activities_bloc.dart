import 'package:flutter_bloc/flutter_bloc.dart';
import 'daily_activities_event.dart';
import 'daily_activities_state.dart';
import '../../domain/repositories/daily_activities_repository.dart';

class DailyActivitiesBloc
    extends Bloc<DailyActivitiesEvent, DailyActivitiesState> {
  final DailyActivitiesRepository repository;
  DailyActivitiesBloc({required this.repository})
    : super(DailyActivitiesInitial()) {
    // Add your event handlers here
  }
}
