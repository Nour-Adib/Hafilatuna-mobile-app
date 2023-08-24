import 'package:hafilatuna/models/enums/accountType.enum.dart';
import 'package:hafilatuna/models/user.model.dart';
import 'package:hafilatuna/services/repo.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'user.service.g.dart';

@RestApi(baseUrl: Repo.url)
abstract class UserService {
  factory UserService(Dio dio, {String baseUrl}) = _UserService;

  @GET(Repo.getProfile)
  Future<User> getProfile(@Header('Authorization') String token);
}
