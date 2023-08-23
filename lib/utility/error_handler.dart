import 'dart:convert';
import 'package:hafilatuna/utility/snackbar.dart';

class ErrorHandlerService {
  static errorHandler(error) {
    var errorResponse = jsonDecode(error.response.toString());
    var errorMessage = errorResponse['message'] is List
        ? errorResponse['message'][0]
        : errorResponse['message'];
    SnackBarService.showErrorSnackbar('Error', errorMessage);
  }
}
