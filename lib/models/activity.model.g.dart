// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Activity _$ActivityFromJson(Map<String, dynamic> json) => Activity(
      activityType: json['activityType'] as String?,
      activityTime: json['activityTime'] as String?,
      activityDate: json['activityDate'] as String?,
    );

Map<String, dynamic> _$ActivityToJson(Activity instance) => <String, dynamic>{
      'activityType': instance.activityType,
      'activityTime': instance.activityTime,
      'activityDate': instance.activityDate,
    };
