import 'package:dio/dio.dart';
import 'package:hafilatuna/models/ticket.model.dart';
import 'package:hafilatuna/services/repo.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/http.dart';

part 'tickets.service.g.dart';

@RestApi(baseUrl: Repo.url)
abstract class TicketsService {
  factory TicketsService(Dio dio, {String baseUrl}) = _TicketsService;

  @GET(Repo.getTicketPath)
  Future<List<Ticket>> getTickets(@Header('Authorization') String token);

  @GET('${Repo.getTicketByIdPath}/{id}')
  Future<Ticket> getTicketById(
      @Header('Authorization') String token, @Path('id') String id);

  @POST(Repo.addTicketPath)
  Future<Ticket> addTicket(@Header('Authorization') String token,
      @Body() CreateTicketRequest ticket);
}

@JsonSerializable()
class CreateTicketRequest {
  @JsonKey(name: 'dropOffAddress')
  String? dropOffAddress;
  @JsonKey(name: 'lon')
  String? lon;
  @JsonKey(name: 'lat')
  String? lat;
  @JsonKey(name: 'dropOffTime')
  String? dropOffTime;
  @JsonKey(name: 'seatNumber')
  int? seatNumber;

  CreateTicketRequest({
    this.dropOffAddress,
    this.lon,
    this.lat,
    this.dropOffTime,
    this.seatNumber,
  });

  factory CreateTicketRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateTicketRequestFromJson(json);
  Map<String, dynamic> toJson() => _$CreateTicketRequestToJson(this);
}
