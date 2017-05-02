import 'dart:core';
import 'package:angular2/core.dart';
import 'package:angular2/src/platform/browser/exceptions.dart';
import 'package:config/config_service.dart';
import 'package:logger/logger_service.dart';
import 'package:http_wrapper/exceptions.dart';
import 'package:angular2/router.dart';
import 'package:auth/auth_service.dart';

@Injectable()
AppExceptionHandler appExceptionHandler(ConfigService config, Injector injector) {
  return new AppExceptionHandler(false, new LoggerService(config), injector);
}

/**
 * Отлов ошибок, отправка их на сервер логирования
 */
@Injectable()
class AppExceptionHandler extends BrowserExceptionHandler {
  bool _rethrowException;
  final LoggerService _logger;
  final Injector _injector;

  AppExceptionHandler(
      [this._rethrowException = true, this._logger = null, this._injector = null])
      : super();

  void call(dynamic exception,
      [dynamic stackTrace = null, String reason = null]) {

    if (handleException(exception))
      return;

    sendToServer(exception, stackTrace, reason);

    super.call(exception, stackTrace, reason);
  }

  void sendToServer(dynamic exception,
      [dynamic stackTrace = null, String reason = null]) {
    try {
      if (_logger != null)
        _logger.error('stackTrace: $stackTrace, exception: $exception');
    } catch (e) {
      print('error while sending logs to server: $e');
    }
  }

  bool handleException(dynamic exception) {

    if (exception is UnauthorizedError) {

      if (_injector == null )
        return false;

      Router router =  _injector.get(Router);
      AuthenticationService authenticationService =  _injector.get(AuthenticationService);

      authenticationService.logout();

      router.navigate(['Auth', {'url':router.lastNavigationAttempt}] );

      return true;
    }

    return false;
  }

}
