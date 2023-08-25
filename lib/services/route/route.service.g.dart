// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route.service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IsEnRoutePathResponse _$IsEnRoutePathResponseFromJson(
        Map<String, dynamic> json) =>
    IsEnRoutePathResponse(
      isEnRoute: json['isEnRoute'] as bool?,
      pickUpLon: json['pickUpLon'] as String?,
      pickUpLat: json['pickUpLat'] as String?,
      school: json['school'] == null
          ? null
          : School.fromJson(json['school'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IsEnRoutePathResponseToJson(
        IsEnRoutePathResponse instance) =>
    <String, dynamic>{
      'isEnRoute': instance.isEnRoute,
      'pickUpLon': instance.pickUpLon,
      'pickUpLat': instance.pickUpLat,
      'school': instance.school,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _RouteSerrvice implements RouteSerrvice {
  _RouteSerrvice(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'http://192.168.0.164:3000';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<IsEnRoutePathResponse> getRoute(
    String token,
    String id,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<IsEnRoutePathResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/ticket/is-en-route/${id}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = IsEnRoutePathResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
