import 'package:swim_success_dev/features/pace_selector/models/swimmer_level.dart';

enum PaceSubmitStatus { initial, loading, success, failure }

class PaceSelectorState {
  final int minutes;
  final int seconds;
  final double distanceMeters;
  final PaceSubmitStatus status;
  final String? errorMessage;

  const PaceSelectorState({
    this.minutes = 2,
    this.seconds = 0,
    this.distanceMeters = 400,
    this.status = PaceSubmitStatus.initial,
    this.errorMessage,
  });

  SwimmerLevel get swimmerLevel => SwimmerLevel.fromPace(
        minutes: minutes,
        seconds: seconds,
      );

  PaceSelectorState copyWith({
    int? minutes,
    int? seconds,
    double? distanceMeters,
    PaceSubmitStatus? status,
    String? errorMessage,
  }) {
    return PaceSelectorState(
      minutes: minutes ?? this.minutes,
      seconds: seconds ?? this.seconds,
      distanceMeters: distanceMeters ?? this.distanceMeters,
      status: status ?? this.status,
      errorMessage: errorMessage,
    );
  }
}
