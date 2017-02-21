import 'dart:core';
import 'dart:async';
import 'package:angular2/platform/browser.dart';
import 'package:angular2/core.dart';
import 'package:angular2/src/core/reflection/reflection.dart';

import 'package:cmas/app_component.dart';

main() async {
  runZoned(() {
    bootstrap(AppComponent);
  }, onError: (error, stackTrace) {
    print('Uncaught error: $error');
  });
}
