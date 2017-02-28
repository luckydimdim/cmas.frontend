import 'dart:core';
import 'package:angular2/core.dart';
import 'package:angular2/src/platform/dom/dom_adapter.dart' show DOM;
import 'package:logger/logger_service.dart';

@Injectable()
AppExceptionHandler appExceptionHandler() {
  return new AppExceptionHandler(DOM, false, new LoggerService());
}

/**
 * Отлов ошибок, отправка их на сервер логирования
 **/
@Injectable()
class AppExceptionHandler extends ExceptionHandler {
  dynamic _dom;
  bool _rethrowException;
  final LoggerService _logger;

  AppExceptionHandler(this._dom, [this._rethrowException = true, this._logger = null])
      : super(_dom, _rethrowException);

  void call(dynamic exception,
      [dynamic stackTrace = null, String reason = null]) {
    sendToServer(exception, stackTrace, reason);

    super.call(exception, stackTrace, reason);
  }

  void sendToServer(dynamic exception,
      [dynamic stackTrace = null, String reason = null]) {
    try {
      if (_logger != null)
        _logger.error('stackTrace: $stackTrace, exception: $exception');
    }
    catch (e) {
      print('error while sending logs to server: $e');
    }
  }
}