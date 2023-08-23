import 'package:hafilatuna/models/enums/accountType.enum.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.model.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: 'eid')
  String? eid;
  @JsonKey(name: 'accountType')
  AccountType? accountType;
  @JsonKey(name: 'createdAt')
  String? createdAt;
  @JsonKey(name: 'updatedAt')
  String? updatedAt;
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'firstName')
  String? firstName;
  @JsonKey(name: 'lastName')
  String? lastName;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'username')
  String? username;
  @JsonKey(name: 'phoneNumber')
  String? phoneNumber;
  @JsonKey(name: 'points')
  int? points;

  User({
    this.eid,
    this.accountType,
    this.createdAt,
    this.updatedAt,
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.username,
    this.phoneNumber,
    this.points,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
