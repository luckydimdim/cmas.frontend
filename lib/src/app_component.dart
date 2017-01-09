import 'package:angular2/core.dart';
import 'package:angular2/platform/common.dart';
import 'package:angular2/router.dart';

//import 'package:cmas/routes.dart';
import 'package:auth/auth_service.dart';
import 'package:auth/auth_component.dart';


@Component(
    selector: 'cmas-app',
    /*providers: const [
      AlertService
    ]*/
    providers: const [
    ROUTER_PROVIDERS,
    const Provider(LocationStrategy, useClass: HashLocationStrategy),
    const Provider(AuthenticationService, useClass: AuthenticationService),
    ]
)

@View(
    templateUrl: 'app_component.html',
    styleUrls: const ['app_component.css'],
    directives: const [RouterLink, /*AlertComponent,*/ RouterOutlet],

)

@RouteConfig(const [AuthComponent.route])

class AppComponent implements  AfterViewInit {

  AppComponent() {

  }

  ngAfterViewInit() {
  }
}
