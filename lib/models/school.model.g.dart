// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'school.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

School _$SchoolFromJson(Map<String, dynamic> json) => School(
      id: json['id'] as String?,
      schoolName: json['schoolName'] as String?,
      longitude: json['longitude'] as String?,
      latitude: json['latitude'] as String?,
      clusterNumber: json['clusterNumber'] as int?,
    );

Map<String, dynamic> _$SchoolToJson(School instance) => <String, dynamic>{
      'id': instance.id,
      'schoolName': instance.schoolName,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'clusterNumber': instance.clusterNumber,
    };
