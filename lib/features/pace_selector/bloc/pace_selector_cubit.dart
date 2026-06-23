import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swim_success_dev/app/di/injector.dart';
import 'package:swim_success_dev/core/network/network_exception.dart';
import 'package:swim_success_dev/domain/models/pace_request.dart';
import 'package:swim_success_dev/domain/repositories/i_pace_repository.dart';
import 'package:swim_success_dev/features/pace_selector/bloc/pace_selector_state.dart';

class PaceSelectorCubit extends Cubit<PaceSelectorState> {
  final IPaceRepository _repository;

  PaceSelectorCubit()
      : _repository = getIt<IPaceRepository>(),
        super(const PaceSelectorState());

  void setMinutes(int minutes) {
    emit(state.copyWith(
      minutes: minutes.clamp(0, 99),
      status: PaceSubmitStatus.initial,
    ));
  }

  void setSeconds(int seconds) {
    emit(state.copyWith(
      seconds: seconds.clamp(0, 59),
      status: PaceSubmitStatus.initial,
    ));
  }

  void setPaceFromSlider(double totalSeconds) {
    final total = totalSeconds.round();
    emit(state.copyWith(
      minutes: total ~/ 60,
      seconds: total % 60,
      status: PaceSubmitStatus.initial,
    ));
  }

  Future<void> submit() async {
    if (state.status == PaceSubmitStatus.loading) return;

    emit(state.copyWith(status: PaceSubmitStatus.loading));

    try {
      await _repository.submitPace(PaceRequest(paceSeconds: state.paceSeconds));
      emit(state.copyWith(status: PaceSubmitStatus.success));
    } on NetworkException catch (e) {
      emit(state.copyWith(
        status: PaceSubmitStatus.failure,
        errorMessage: e.message,
      ));
    } catch (_) {
      emit(state.copyWith(
        status: PaceSubmitStatus.failure,
        errorMessage: 'Something went wrong',
      ));
    }
  }

  void reset() => emit(const PaceSelectorState());
}
