import 'package:hafilatuna/models/activity.model.dart';
import 'package:hafilatuna/models/school.model.dart';
import 'package:hafilatuna/models/user.model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ticket.model.g.dart';

@JsonSerializable()
class Ticket {
  @JsonKey(name: 'createdAt')
  String? createdAt;
  @JsonKey(name: 'updatedAt')
  String? updatedAt;
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'activationDate')
  String? activationDate;
  @JsonKey(name: 'expirationDate')
  String? expirationDate;
  @JsonKey(name: 'seatNumber')
  int? seatNumber;
  @JsonKey(name: 'busCode')
  String? busCode;
  @JsonKey(name: 'clusterNumber')
  int? clusterNumber;
  @JsonKey(name: 'user')
  User? user;
  @JsonKey(name: 'school')
  School? school;
  @JsonKey(name: 'activities')
  List<Activity>? activities;

  Ticket({
    this.createdAt,
    this.updatedAt,
    this.id,
    this.activationDate,
    this.expirationDate,
    this.seatNumber,
    this.busCode,
    this.clusterNumber,
    this.user,
  });

  factory Ticket.fromJson(Map<String, dynamic> json) => _$TicketFromJson(json);
  Map<String, dynamic> toJson() => _$TicketToJson(this);
}
