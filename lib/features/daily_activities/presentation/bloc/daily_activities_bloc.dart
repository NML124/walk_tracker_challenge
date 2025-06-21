import 'package:flutter_bloc/flutter_bloc.dart';
import 'daily_activities_event.dart';
import 'daily_activities_state.dart';

class DailyActivitiesBloc extends Bloc<DailyActivitiesEvent, DailyActivitiesState> {
  DailyActivitiesBloc() : super(DailyActivitiesInitial()) {
    // Add your event handlers here
  }
}
