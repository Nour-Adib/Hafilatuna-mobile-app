import 'package:dio/dio.dart';
import 'package:hafilatuna/models/ticket.model.dart';
import 'package:hafilatuna/services/repo.dart';
import 'package:retrofit/http.dart';

part 'tickets.service.g.dart';

@RestApi(baseUrl: Repo.url)
abstract class TicketsService {
  factory TicketsService(Dio dio, {String baseUrl}) = _TicketsService;

  @GET(Repo.getTicketPath)
  Future<List<Ticket>> getTickets(@Header('Authorization') String token);

  @GET('${Repo.getTicketByIdPath}/{id}')
  Future<Ticket> getTicketById(@Header('Authorization') String token, @Path('id') String id);
}