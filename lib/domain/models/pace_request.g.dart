// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pace_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaceRequestImpl _$$PaceRequestImplFromJson(Map<String, dynamic> json) =>
    _$PaceRequestImpl(
      minutes: (json['minutes'] as num).toInt(),
      seconds: (json['seconds'] as num).toInt(),
      distanceMeters: (json['distanceMeters'] as num).toInt(),
      swimmerLevel: json['swimmerLevel'] as String,
    );

Map<String, dynamic> _$$PaceRequestImplToJson(_$PaceRequestImpl instance) =>
    <String, dynamic>{
      'minutes': instance.minutes,
      'seconds': instance.seconds,
      'distanceMeters': instance.distanceMeters,
      'swimmerLevel': instance.swimmerLevel,
    };
