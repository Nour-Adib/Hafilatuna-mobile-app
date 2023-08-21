import 'package:json_annotation/json_annotation.dart';

part 'ticket.model.g.dart';

@JsonSerializable()
class Ticket {
  @JsonKey(name: 'studentName')
  String? studentName;
  @JsonKey(name: 'schoolName')
  String? schoolName;
  @JsonKey(name: 'busNumber')
  String? busNumber;
  @JsonKey(name: 'seatNumber')
  String? seatNumber;
  @JsonKey(name: 'currentStatus')
  String? currentStatus;

  Ticket({
    this.studentName,
    this.schoolName,
    this.busNumber,
    this.seatNumber,
    this.currentStatus,
  });

  factory Ticket.fromJson(Map<String, dynamic> json) => _$TicketFromJson(json);
  Map<String, dynamic> toJson() => _$TicketToJson(this);
}
