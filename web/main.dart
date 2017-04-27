import 'dart:core';
import 'package:angular2/platform/browser.dart';
import 'package:angular2/core.dart';
import 'package:angular2/src/core/reflection/reflection.dart';
import 'package:cmas/app_component.dart';
import 'package:cmas/app_exception_handler.dart';
import 'package:angular2/router.dart';
import 'package:config/config_service.dart';
import 'package:http/http.dart';
import 'package:http/browser_client.dart';
import 'package:logger/logger_service.dart';
import 'package:aside/aside_service.dart';
import 'package:http_wrapper/http_wrapper.dart';
import 'package:auth/auth_service.dart';

import 'package:angular2/platform/common.dart';
bool get isDebug =>
    (const String.fromEnvironment('PRODUCTION', defaultValue: 'false')) !=
    'true';

main() async {
  if (isDebug) {
    reflector.trackUsage();
  }

  ComponentRef ref = await bootstrap(AppComponent, [
    ROUTER_PROVIDERS,

    const Provider(LocationStrategy, useClass: HashLocationStrategy),
    BROWSER_APP_PROVIDERS,
    const Provider(ExceptionHandler,
        useFactory: appExceptionHandler, deps: const [ConfigService, Injector]),
    const Provider(LoggerService),
    const Provider(ConfigService),
    const Provider(AsideService),
    const Provider(AuthenticationService),
    provide(Client, useFactory: () => new BrowserClient(), deps: []),
    provide(HttpWrapper, useFactory: (_http, _authenticationService) => new HttpWrapper(_http, _authenticationService), deps: [Client, AuthenticationService])
    // provide(Client, useClass: InMemoryDataService)
    // Using a real back end?
    // Import browser_client.dart and change the above to:
    // [provide(Client, useFactory: () => new BrowserClient(), deps: [])]
  ]);

  if (isDebug) {
    print('Application in DebugMode');
    enableDebugTools(ref);
    print('Unused keys: ${reflector.listUnusedKeys()}');
  }
}
