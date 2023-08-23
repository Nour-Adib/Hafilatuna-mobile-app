// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      eid: json['eid'] as String?,
      accountType:
          $enumDecodeNullable(_$AccountTypeEnumMap, json['accountType']),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      id: json['id'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      username: json['username'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      points: json['points'] as int?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'eid': instance.eid,
      'accountType': _$AccountTypeEnumMap[instance.accountType],
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'username': instance.username,
      'phoneNumber': instance.phoneNumber,
      'points': instance.points,
    };

const _$AccountTypeEnumMap = {
  AccountType.Standalone: 'Standalone',
  AccountType.Parent: 'Parent',
  AccountType.Child: 'Child',
};
