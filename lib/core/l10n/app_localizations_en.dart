// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get dailyGoal => 'daily goal';

  @override
  String get calories => 'calories';

  @override
  String get steps => 'steps';

  @override
  String get hours => 'hours';

  @override
  String get sleep => 'sleep';

  @override
  String get activities => 'activities';

  @override
  String get journal => 'journal';

  @override
  String get account => 'account';

  @override
  String get dailyGoals => 'daily goals';

  @override
  String get profile => 'profile';

  @override
  String get yearsOld => 'years old';

  @override
  String get login => 'login';

  @override
  String get morningWalk => 'Morning Walk';

  @override
  String get afternoonWalk => 'Afternoon Walk';

  @override
  String get eveningWalk => 'Evening Walk';

  @override
  String walkDistanceTime(double distance, int duration) {
    return '${distance}km in ${duration}mins';
  }

  @override
  String get settings => 'Settings';

  @override
  String get themeMode => 'Theme Mode';

  @override
  String get language => 'Language';
}
