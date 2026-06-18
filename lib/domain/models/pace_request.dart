import 'package:freezed_annotation/freezed_annotation.dart';

part 'pace_request.freezed.dart';
part 'pace_request.g.dart';

@freezed
class PaceRequest with _$PaceRequest {
  const factory PaceRequest({
    required int minutes,
    required int seconds,
    required int distanceMeters,
    required String swimmerLevel,
  }) = _PaceRequest;

  factory PaceRequest.fromJson(Map<String, dynamic> json) =>
      _$PaceRequestFromJson(json);
}
