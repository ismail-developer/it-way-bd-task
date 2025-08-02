import 'package:logger/logger.dart';

class AppLogger {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 5,
      lineLength: 80,
      colors: true,
      printEmojis: true,
      dateTimeFormat: DateTimeFormat.dateAndTime,
    ),
    level: Level.debug,
  );

  static void debug(
    String message, {
    DateTime? time,
    dynamic error,
    StackTrace? stackTrace,
  }) {
    _logger.d(message, time: time, error: error, stackTrace: stackTrace);
  }

  static void info(
    String message, {
    DateTime? time,
    dynamic error,
    StackTrace? stackTrace,
  }) {
    _logger.i(message, time: time, error: error, stackTrace: stackTrace);
  }

  static void warning(
    String message, {
    DateTime? time,
    dynamic error,
    StackTrace? stackTrace,
  }) {
    _logger.w(message, time: time, error: error, stackTrace: stackTrace);
  }

  static void error(
    String message, {
    DateTime? time,
    dynamic error,
    StackTrace? stackTrace,
  }) {
    _logger.e(message, time: time, error: error, stackTrace: stackTrace);
  }
}