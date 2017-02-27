import 'dart:core';
import 'package:angular2/core.dart';
import "package:angular2/src/platform/dom/dom_adapter.dart" show DOM;

@Injectable()
AppExceptionHandler appExceptionHandler() {
  return new AppExceptionHandler(DOM, false);
}

/*
* Отлов ошибок, отправка их на сервер логирования
* */
@Injectable()
class AppExceptionHandler extends ExceptionHandler {
  dynamic _logger;
  bool _rethrowException;

  AppExceptionHandler(this._logger, [this._rethrowException = true])
      : super(_logger, _rethrowException);

  void call(dynamic exception,
      [dynamic stackTrace = null, String reason = null]) {
    sendToServer(exception, stackTrace, reason);

    super.call(exception, stackTrace, reason);
  }

  void sendToServer(dynamic exception,
      [dynamic stackTrace = null, String reason = null]) {
    try {
      /* send log to server or save to local storage */
    }
    catch (e) {
      print('error while sending logs to server: $e');
    }
  }
}