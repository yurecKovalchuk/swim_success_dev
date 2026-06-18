enum SwimmerLevel {
  beginner,
  intermediate,
  advanced,
  elite;

  String get label {
    switch (this) {
      case SwimmerLevel.beginner:
        return 'Beginner';
      case SwimmerLevel.intermediate:
        return 'Intermediate';
      case SwimmerLevel.advanced:
        return 'Advanced';
      case SwimmerLevel.elite:
        return 'Elite';
    }
  }

  String get description {
    switch (this) {
      case SwimmerLevel.beginner:
        return 'Pace > 2:30 / 100m';
      case SwimmerLevel.intermediate:
        return 'Pace 2:00 – 2:30 / 100m';
      case SwimmerLevel.advanced:
        return 'Pace 1:30 – 2:00 / 100m';
      case SwimmerLevel.elite:
        return 'Pace < 1:30 / 100m';
    }
  }

  static SwimmerLevel fromPace({required int minutes, required int seconds}) {
    final totalSeconds = minutes * 60 + seconds;
    if (totalSeconds < 90) return SwimmerLevel.elite;
    if (totalSeconds < 120) return SwimmerLevel.advanced;
    if (totalSeconds < 150) return SwimmerLevel.intermediate;
    return SwimmerLevel.beginner;
  }
}
