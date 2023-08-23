import 'package:json_annotation/json_annotation.dart';

part 'activity.model.g.dart';

@JsonSerializable()
class Activity {
  @JsonKey(name: 'createdAt')
  String? createdAt;
  @JsonKey(name: 'updatedAt')
  String? updatedAt;
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'action')
  String? action;
  @JsonKey(name: 'timestamp')
  String? timestamp;

  Activity({
    this.createdAt,
    this.updatedAt,
    this.id,
    this.action,
    this.timestamp,
  });

  factory Activity.fromJson(Map<String, dynamic> json) =>
      _$ActivityFromJson(json);
  Map<String, dynamic> toJson() => _$ActivityToJson(this);
}
