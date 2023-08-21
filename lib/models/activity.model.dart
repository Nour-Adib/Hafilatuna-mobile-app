import 'package:json_annotation/json_annotation.dart';

part 'activity.model.g.dart';

@JsonSerializable()
class Activity {
  @JsonKey(name: 'activityType')
  String? activityType;
  @JsonKey(name: 'activityTime')
  String? activityTime;
  @JsonKey(name: 'activityDate')
  String? activityDate;

  Activity({
    this.activityType,
    this.activityTime,
    this.activityDate,
  });

  factory Activity.fromJson(Map<String, dynamic> json) =>
      _$ActivityFromJson(json);
  Map<String, dynamic> toJson() => _$ActivityToJson(this);
}
