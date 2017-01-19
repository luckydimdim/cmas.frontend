import 'dart:html';

import 'package:angular2/core.dart';
import 'package:angular2/platform/common.dart';
import 'package:angular2/router.dart';

import 'package:auth/auth_service.dart';
import 'package:auth/auth_component.dart';

import 'package:alert/alert_service.dart';
import 'package:alert/alert_component.dart';

import 'package:contract_view/contract_view_component.dart';
import 'package:dashboard/dashboard_component.dart';

@Component(
    selector: 'master'
)

@View(
  templateUrl: 'master_component.html',
  directives: const [RouterLink, AlertComponent, RouterOutlet],

)



@RouteConfig(const [ContractViewComponent.route, DashboardComponent.route])
class MasterComponent implements AfterViewInit {


  static const String route_name = "Master";
  static const String route_path = "master/...";
  static const Route route = const Route(
      path: MasterComponent.route_path,
      component: MasterComponent,
      name: MasterComponent.route_name,
      useAsDefault: true
  );


  final AlertService _alertService;


  MasterComponent(this._alertService) {

  }

  @override
  void ngAfterViewInit() {
    //_alertService.Info('ngAfterViewInit!');

    var script = new ScriptElement()
      ..async = true
      ..type = 'text/javascript'
      ..src = 'assets/js/common.js';
    document.body.append(script);
  }
}