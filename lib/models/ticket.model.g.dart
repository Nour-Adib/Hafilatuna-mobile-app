// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ticket _$TicketFromJson(Map<String, dynamic> json) => Ticket(
      studentName: json['studentName'] as String?,
      schoolName: json['schoolName'] as String?,
      busNumber: json['busNumber'] as String?,
      seatNumber: json['seatNumber'] as String?,
      currentStatus: json['currentStatus'] as String?,
    );

Map<String, dynamic> _$TicketToJson(Ticket instance) => <String, dynamic>{
      'studentName': instance.studentName,
      'schoolName': instance.schoolName,
      'busNumber': instance.busNumber,
      'seatNumber': instance.seatNumber,
      'currentStatus': instance.currentStatus,
    };
