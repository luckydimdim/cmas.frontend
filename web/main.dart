import 'dart:core';
import 'package:angular2/platform/browser.dart';
import 'package:angular2/core.dart';
import 'package:angular2/src/core/reflection/reflection.dart';
import 'package:cmas/app_component.dart';
import 'package:cmas/app_exception_handler.dart';

import 'package:http/http.dart';
import 'package:http/browser_client.dart';

bool get isDebug =>
    (const String.fromEnvironment('PRODUCTION', defaultValue: 'false')) !=
        'true';

main() async {
  if (isDebug) {
    reflector.trackUsage();
  }

  ComponentRef ref = await bootstrap(AppComponent, [BROWSER_APP_PROVIDERS,
    const Provider(ExceptionHandler, useFactory: appExceptionHandler, deps: const []),
    provide(Client, useFactory: () => new BrowserClient(), deps: [])
  ]);

  if (isDebug) {
    print('Application in DebugMode');
    enableDebugTools(ref);
    print('Unused keys: ${reflector.listUnusedKeys()}');
  }
}
