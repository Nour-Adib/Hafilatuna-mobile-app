import 'package:dio/dio.dart';
import 'package:hafilatuna/models/school.model.dart';
import 'package:hafilatuna/services/repo.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/http.dart';

part 'route.service.g.dart';

@RestApi(baseUrl: Repo.url)
abstract class RouteSerrvice {
  factory RouteSerrvice(Dio dio, {String baseUrl}) = _RouteSerrvice;

  @GET('${Repo.getIsEnRoutePath}/{id}')
  Future<IsEnRoutePathResponse> getRoute(
      @Header('Authorization') String token, @Path('id') String id);
}

@JsonSerializable()
class IsEnRoutePathResponse {
  @JsonKey(name: 'isEnRoute')
  bool? isEnRoute;
  @JsonKey(name: 'pickUpLon')
  String? pickUpLon;
  @JsonKey(name: 'pickUpLat')
  String? pickUpLat;
  @JsonKey(name: 'school')
  School? school;

  IsEnRoutePathResponse(
      {this.isEnRoute, this.pickUpLon, this.pickUpLat, this.school});

  factory IsEnRoutePathResponse.fromJson(Map<String, dynamic> json) =>
      _$IsEnRoutePathResponseFromJson(json);
  Map<String, dynamic> toJson() => _$IsEnRoutePathResponseToJson(this);
}
