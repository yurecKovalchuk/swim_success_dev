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
  @JsonKey(name: 'pace_seconds')
  int get paceSeconds => throw _privateConstructorUsedError;

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
  $Res call({@JsonKey(name: 'pace_seconds') int paceSeconds});
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
  $Res call({Object? paceSeconds = null}) {
    return _then(
      _value.copyWith(
            paceSeconds: null == paceSeconds
                ? _value.paceSeconds
                : paceSeconds // ignore: cast_nullable_to_non_nullable
                      as int,
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
  $Res call({@JsonKey(name: 'pace_seconds') int paceSeconds});
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
  $Res call({Object? paceSeconds = null}) {
    return _then(
      _$PaceRequestImpl(
        paceSeconds: null == paceSeconds
            ? _value.paceSeconds
            : paceSeconds // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PaceRequestImpl implements _PaceRequest {
  const _$PaceRequestImpl({
    @JsonKey(name: 'pace_seconds') required this.paceSeconds,
  });

  factory _$PaceRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaceRequestImplFromJson(json);

  @override
  @JsonKey(name: 'pace_seconds')
  final int paceSeconds;

  @override
  String toString() {
    return 'PaceRequest(paceSeconds: $paceSeconds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaceRequestImpl &&
            (identical(other.paceSeconds, paceSeconds) ||
                other.paceSeconds == paceSeconds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, paceSeconds);

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
    @JsonKey(name: 'pace_seconds') required final int paceSeconds,
  }) = _$PaceRequestImpl;

  factory _PaceRequest.fromJson(Map<String, dynamic> json) =
      _$PaceRequestImpl.fromJson;

  @override
  @JsonKey(name: 'pace_seconds')
  int get paceSeconds;

  /// Create a copy of PaceRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaceRequestImplCopyWith<_$PaceRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
