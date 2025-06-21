enum ActivityPeriod { morning, afternoon, evening }

class TrajectoryPoint {
  final double lat;
  final double lon;
  final DateTime timeStamp;

  TrajectoryPoint({
    required this.lat,
    required this.lon,
    required this.timeStamp,
  });
}

class JournalActivity {
  final double distance;
  final Duration duration;
  final ActivityPeriod activityPeriod;
  final List<TrajectoryPoint> trajectory;
  final DateTime date; // Date when this activity was made

  JournalActivity({
    required this.distance,
    required this.duration,
    required this.activityPeriod,
    required this.date,
    this.trajectory = const [],
  });
}
