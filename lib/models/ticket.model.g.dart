// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ticket _$TicketFromJson(Map<String, dynamic> json) => Ticket(
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      id: json['id'] as String?,
      activationDate: json['activationDate'] as String?,
      expirationDate: json['expirationDate'] as String?,
      seatNumber: json['seatNumber'] as int?,
      busCode: json['busCode'] as String?,
      clusterNumber: json['clusterNumber'] as int?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    )
      ..school = json['school'] == null
          ? null
          : School.fromJson(json['school'] as Map<String, dynamic>)
      ..activities = (json['activities'] as List<dynamic>?)
          ?.map((e) => Activity.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$TicketToJson(Ticket instance) => <String, dynamic>{
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'id': instance.id,
      'activationDate': instance.activationDate,
      'expirationDate': instance.expirationDate,
      'seatNumber': instance.seatNumber,
      'busCode': instance.busCode,
      'clusterNumber': instance.clusterNumber,
      'user': instance.user,
      'school': instance.school,
      'activities': instance.activities,
    };
