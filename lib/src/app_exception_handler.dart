import 'dart:core';
import 'package:angular2/core.dart';

/*
* Отлов ошибок, отправка их на сервер логирования
* */
@Injectable()
class AppExceptionHandler extends  ExceptionHandler {
  dynamic _logger;
  bool _rethrowException;

  AppExceptionHandler(this._logger, [this._rethrowException = true]):  super(_logger, _rethrowException);

  void call(dynamic exception, [dynamic stackTrace = null, String reason = null]) {
    super.call(exception, stackTrace,reason);
  }
}