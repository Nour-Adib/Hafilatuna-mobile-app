import 'package:logger/logger.dart';

class LoggerService {
  LoggerService._privateConstructor();

  var logger = Logger();

  static final LoggerService _instance = LoggerService._privateConstructor();

  factory LoggerService() {
    return _instance;
  }

  void logDebug(text) {
    logger.d(text);
  }

  void logError(text) {
    logger.e(text);
  }

  void logInfo(text) {
    logger.i(text);
  }

  void logWarning(text) {
    logger.w(text);
  }

  void logWTF(text) {
    logger.wtf(text);
  }

  void logVerbose(text) {
    logger.v(text);
  }
}
