import 'package:hafilatuna/models/enums/accountType.enum.dart';
import 'package:hafilatuna/services/repo.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'auth.service.g.dart';

@RestApi(baseUrl: Repo.url)
abstract class AuthService {
  factory AuthService(Dio dio, {String baseUrl}) = _AuthService;

  @POST(Repo.loginPath)
  Future<LoginResponse> login(@Body() LoginRequest request);

  @POST(Repo.registerPath)
  Future<RegisterResponse> register(@Body() SignUpRequest request);
}

@JsonSerializable()
class LoginResponse {
  @JsonKey(name: 'access_token')
  String? accessToken;

  LoginResponse({this.accessToken});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class LoginRequest {
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'password')
  String? password;

  LoginRequest();
  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);
  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}

@JsonSerializable()
class SignUpRequest {
  @JsonKey(name: 'firstName')
  String? firstName;
  @JsonKey(name: 'lastName')
  String? lastName;
  @JsonKey(name: 'eid')
  String? eid;
  @JsonKey(name: 'phoneNumber')
  String? phoneNumber;
  @JsonKey(name: 'email') 
  String? email;
  @JsonKey(name: 'username')
  String? username;
  @JsonKey(name: 'password')
  String? password;
  @JsonKey(name: 'confirmPassword')
  String? confirmPassword;
  @JsonKey(name: 'accountType')
  AccountType? accountType;

  SignUpRequest();
  factory SignUpRequest.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestFromJson(json);
  Map<String, dynamic> toJson() => _$SignUpRequestToJson(this);
}

@JsonSerializable()
class RegisterResponse {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? profilePictureUrl;

  RegisterResponse(
      {this.id,
      this.firstName,
      this.lastName,
      this.email});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);
}

