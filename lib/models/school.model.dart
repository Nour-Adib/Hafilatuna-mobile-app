import 'package:json_annotation/json_annotation.dart';

part 'school.model.g.dart';

@JsonSerializable()
class School {
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'schoolName')
  String? schoolName;
  @JsonKey(name: 'longitude')
  String? longitude;
  @JsonKey(name: 'latitude')
  String? latitude;
  @JsonKey(name: 'clusterNumber')
  int? clusterNumber;

  School({
    this.id,
    this.schoolName,
    this.longitude,
    this.latitude,
    this.clusterNumber,
  });

  factory School.fromJson(Map<String, dynamic> json) => _$SchoolFromJson(json);
  Map<String, dynamic> toJson() => _$SchoolToJson(this);
}
