import 'package:json_annotation/json_annotation.dart';

part 'leaderboard.model.g.dart';

@JsonSerializable()
class Leaderboard {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'action')
  int? action;

  Leaderboard({
    this.name,
    this.action,
  });

  factory Leaderboard.fromJson(Map<String, dynamic> json) =>
      _$LeaderboardFromJson(json);
}
