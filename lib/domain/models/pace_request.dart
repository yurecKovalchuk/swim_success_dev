// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pace_request.freezed.dart';
part 'pace_request.g.dart';

@freezed
class PaceRequest with _$PaceRequest {
  const factory PaceRequest({
    @JsonKey(name: 'pace_seconds') required int paceSeconds,
  }) = _PaceRequest;

  factory PaceRequest.fromJson(Map<String, dynamic> json) =>
      _$PaceRequestFromJson(json);
}
