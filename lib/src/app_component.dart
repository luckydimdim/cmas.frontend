import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import 'package:auth/auth_service.dart';
import 'package:auth/auth_component.dart';


import 'package:alert/alert_service.dart';
import 'package:alert/alert_component.dart';
import 'master/master_component.dart';

import 'package:auth_router_outlet/auth_router_outlet.dart';

import 'package:resources_loader/resources_loader.dart';

const String authPath = 'auth';

@Component(selector: 'cmas-app', providers: const [

  const Provider(AlertService, useClass: AlertService),
  const Provider(ResourcesLoaderService, useClass: ResourcesLoaderService)
])
@View(templateUrl: 'app_component.html', directives: const [
  MasterComponent,
  AlertComponent,
  AuthComponent,
  AuthRouterOutlet
])
@RouteConfig(const [
  const Route(
      path: '/...',
      component: MasterComponent,
      name: 'Master',
      useAsDefault: true),
  const Route(path: authPath, component: AuthComponent, name: 'Auth')
])
class AppComponent implements AfterViewInit {
  final AuthenticationService _authService;

  bool isAuth = false;

  AppComponent(this._authService) {
    _authService.authPath = authPath;
  }

  @override
  void ngAfterViewInit() {
    if (_authService.isAuth())
      isAuth = true;
    else
      isAuth = false;
  }
}
