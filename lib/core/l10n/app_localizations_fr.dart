// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get dailyGoal => 'objectif quotidien';

  @override
  String get calories => 'calories';

  @override
  String get steps => 'pas';

  @override
  String get hours => 'heures';

  @override
  String get sleep => 'Sommeil';

  @override
  String get activities => 'activités';

  @override
  String get journal => 'journal';

  @override
  String get account => 'compte';

  @override
  String get dailyGoals => 'objectifs quotidiens';

  @override
  String get profile => 'profil';

  @override
  String get yearsOld => 'ans';

  @override
  String get login => 'se connecter';

  @override
  String get morningWalk => 'Marche du matin';

  @override
  String get afternoonWalk => 'Marche de l\'après-midi';

  @override
  String get eveningWalk => 'Marche du soir';

  @override
  String walkDistanceTime(double distance, int duration) {
    return '$distance km en $duration min';
  }
}
