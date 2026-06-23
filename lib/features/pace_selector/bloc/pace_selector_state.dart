import 'package:swim_success_dev/features/pace_selector/models/swimmer_level.dart';

enum PaceSubmitStatus { initial, loading, success, failure }

class PaceSelectorState {
  final int minutes;
  final int seconds;
  final PaceSubmitStatus status;
  final String? errorMessage;

  const PaceSelectorState({
    this.minutes = 2,
    this.seconds = 0,
    this.status = PaceSubmitStatus.initial,
    this.errorMessage,
  });

  int get paceSeconds => minutes * 60 + seconds;

  SwimmerLevel get swimmerLevel => SwimmerLevel.fromPace(
        minutes: minutes,
        seconds: seconds,
      );

  PaceSelectorState copyWith({
    int? minutes,
    int? seconds,
    PaceSubmitStatus? status,
    String? errorMessage,
  }) {
    return PaceSelectorState(
      minutes: minutes ?? this.minutes,
      seconds: seconds ?? this.seconds,
      status: status ?? this.status,
      errorMessage: errorMessage,
    );
  }
}
