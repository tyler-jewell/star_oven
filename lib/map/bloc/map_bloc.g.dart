// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MapState _$MapStateFromJson(Map<String, dynamic> json) => MapState(
      status: $enumDecodeNullable(_$MapStatusEnumMap, json['status']) ??
          MapStatus.initial,
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MapStateToJson(MapState instance) => <String, dynamic>{
      'status': _$MapStatusEnumMap[instance.status],
      'location': instance.location,
    };

const _$MapStatusEnumMap = {
  MapStatus.initial: 'initial',
  MapStatus.loading: 'loading',
  MapStatus.success: 'success',
  MapStatus.failure: 'failure',
};
