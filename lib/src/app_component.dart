import 'package:angular2/core.dart';
import 'package:angular2/platform/common.dart';
import 'package:angular2/router.dart';

//import 'package:cmas/routes.dart';
import 'package:auth/auth_service.dart';
import 'package:auth/auth_component.dart';
import 'package:alert/alert_service.dart';
import 'package:alert/alert_component.dart';

@Component(
    selector: 'cmas-app',

    providers: const [
    ROUTER_PROVIDERS,
    const Provider(LocationStrategy, useClass: HashLocationStrategy),
    const Provider(AuthenticationService, useClass: AuthenticationService),
    const Provider(AlertService, useClass: AlertService),
    ]
)

@View(
    templateUrl: 'app_component.html',
    styleUrls: const ['app_component.css'],
    directives: const [RouterLink, AlertComponent, RouterOutlet],

)

@RouteConfig(const [AuthComponent.route])

class AppComponent implements  AfterViewInit {
  final AlertService _alertService;

  AppComponent(this._alertService) {

  }

  ngAfterViewInit() {
    _alertService.Info('ngAfterViewInit!');
  }
}
