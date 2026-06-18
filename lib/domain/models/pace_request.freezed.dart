// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pace_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PaceRequest _$PaceRequestFromJson(Map<String, dynamic> json) {
  return _PaceRequest.fromJson(json);
}

/// @nodoc
mixin _$PaceRequest {
  int get minutes => throw _privateConstructorUsedError;
  int get seconds => throw _privateConstructorUsedError;
  int get distanceMeters => throw _privateConstructorUsedError;
  String get swimmerLevel => throw _privateConstructorUsedError;

  /// Serializes this PaceRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaceRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaceRequestCopyWith<PaceRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaceRequestCopyWith<$Res> {
  factory $PaceRequestCopyWith(
    PaceRequest value,
    $Res Function(PaceRequest) then,
  ) = _$PaceRequestCopyWithImpl<$Res, PaceRequest>;
  @useResult
  $Res call({
    int minutes,
    int seconds,
    int distanceMeters,
    String swimmerLevel,
  });
}

/// @nodoc
class _$PaceRequestCopyWithImpl<$Res, $Val extends PaceRequest>
    implements $PaceRequestCopyWith<$Res> {
  _$PaceRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaceRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minutes = null,
    Object? seconds = null,
    Object? distanceMeters = null,
    Object? swimmerLevel = null,
  }) {
    return _then(
      _value.copyWith(
            minutes: null == minutes
                ? _value.minutes
                : minutes // ignore: cast_nullable_to_non_nullable
                      as int,
            seconds: null == seconds
                ? _value.seconds
                : seconds // ignore: cast_nullable_to_non_nullable
                      as int,
            distanceMeters: null == distanceMeters
                ? _value.distanceMeters
                : distanceMeters // ignore: cast_nullable_to_non_nullable
                      as int,
            swimmerLevel: null == swimmerLevel
                ? _value.swimmerLevel
                : swimmerLevel // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PaceRequestImplCopyWith<$Res>
    implements $PaceRequestCopyWith<$Res> {
  factory _$$PaceRequestImplCopyWith(
    _$PaceRequestImpl value,
    $Res Function(_$PaceRequestImpl) then,
  ) = __$$PaceRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int minutes,
    int seconds,
    int distanceMeters,
    String swimmerLevel,
  });
}

/// @nodoc
class __$$PaceRequestImplCopyWithImpl<$Res>
    extends _$PaceRequestCopyWithImpl<$Res, _$PaceRequestImpl>
    implements _$$PaceRequestImplCopyWith<$Res> {
  __$$PaceRequestImplCopyWithImpl(
    _$PaceRequestImpl _value,
    $Res Function(_$PaceRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PaceRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minutes = null,
    Object? seconds = null,
    Object? distanceMeters = null,
    Object? swimmerLevel = null,
  }) {
    return _then(
      _$PaceRequestImpl(
        minutes: null == minutes
            ? _value.minutes
            : minutes // ignore: cast_nullable_to_non_nullable
                  as int,
        seconds: null == seconds
            ? _value.seconds
            : seconds // ignore: cast_nullable_to_non_nullable
                  as int,
        distanceMeters: null == distanceMeters
            ? _value.distanceMeters
            : distanceMeters // ignore: cast_nullable_to_non_nullable
                  as int,
        swimmerLevel: null == swimmerLevel
            ? _value.swimmerLevel
            : swimmerLevel // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PaceRequestImpl implements _PaceRequest {
  const _$PaceRequestImpl({
    required this.minutes,
    required this.seconds,
    required this.distanceMeters,
    required this.swimmerLevel,
  });

  factory _$PaceRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaceRequestImplFromJson(json);

  @override
  final int minutes;
  @override
  final int seconds;
  @override
  final int distanceMeters;
  @override
  final String swimmerLevel;

  @override
  String toString() {
    return 'PaceRequest(minutes: $minutes, seconds: $seconds, distanceMeters: $distanceMeters, swimmerLevel: $swimmerLevel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaceRequestImpl &&
            (identical(other.minutes, minutes) || other.minutes == minutes) &&
            (identical(other.seconds, seconds) || other.seconds == seconds) &&
            (identical(other.distanceMeters, distanceMeters) ||
                other.distanceMeters == distanceMeters) &&
            (identical(other.swimmerLevel, swimmerLevel) ||
                other.swimmerLevel == swimmerLevel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, minutes, seconds, distanceMeters, swimmerLevel);

  /// Create a copy of PaceRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaceRequestImplCopyWith<_$PaceRequestImpl> get copyWith =>
      __$$PaceRequestImplCopyWithImpl<_$PaceRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaceRequestImplToJson(this);
  }
}

abstract class _PaceRequest implements PaceRequest {
  const factory _PaceRequest({
    required final int minutes,
    required final int seconds,
    required final int distanceMeters,
    required final String swimmerLevel,
  }) = _$PaceRequestImpl;

  factory _PaceRequest.fromJson(Map<String, dynamic> json) =
      _$PaceRequestImpl.fromJson;

  @override
  int get minutes;
  @override
  int get seconds;
  @override
  int get distanceMeters;
  @override
  String get swimmerLevel;

  /// Create a copy of PaceRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaceRequestImplCopyWith<_$PaceRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
