import 'dart:core';
import 'package:alert/alert_service.dart';
import 'package:angular2/core.dart';
import 'package:angular2/src/platform/browser/exceptions.dart';
import 'package:config/config_service.dart';
import 'package:logger/logger_service.dart';
import 'package:http_wrapper/exceptions.dart';
import 'package:angular2/router.dart';
import 'package:auth/auth_service.dart';

@Injectable()
AppExceptionHandler appExceptionHandler(
    ConfigService config, Injector injector) {
  return new AppExceptionHandler(new LoggerService(config), injector);
}

/**
 * Отлов ошибок, отправка их на сервер логирования
 */
@Injectable()
class AppExceptionHandler extends BrowserExceptionHandler {
  final LoggerService _logger;
  final Injector _injector;

  AppExceptionHandler([this._logger = null, this._injector = null]) : super();

  void call(dynamic exception,
      [dynamic stackTrace = null, String reason = null]) {
    if (handleException(exception)) return;

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
      if (_injector == null) return false;

      Router router = _injector.get(Router);

      AuthenticationService authenticationService =
          _injector.get(AuthenticationService);

      authenticationService.logout();

      router.navigate([
        'Auth',
        {'url': router.lastNavigationAttempt}
      ]);

      return true;
    } else if (exception is GeneralError) {
      String message = (exception as GeneralError).details;

      AlertService alertService = _injector.get(AlertService);
      alertService.Danger('Ошибка: $message');
      return true;
    } else if (exception is InternalServerError) {
      AlertService alertService = _injector.get(AlertService);
      alertService.Danger('Непредвиденная ошибка');
      return true;
    } else if (exception is ConnectionError) {
      AlertService alertService = _injector.get(AlertService);
      alertService.Danger('Ошибка связи с сервером');
      return true;
    } else if (exception is ForbiddenError) {
      AlertService alertService = _injector.get(AlertService);
      alertService.Warning('Ошибка: доступ запрещен');
      return true;
    } else if (exception is NonCriticalError) {
      return true;
    }

    return false;
  }
}
