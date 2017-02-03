import 'dart:html';

import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import 'package:alert/alert_service.dart';
import 'package:alert/alert_component.dart';

import 'package:contract/contract_component.dart';
import 'package:dashboard/dashboard_component.dart';
import 'package:contract_list/contract_list_component.dart';
import 'package:object_budget_list/object_budget_list_component.dart';
import 'package:payment_budget_list/payment_budget_list_component.dart';
import 'package:request_list/request_list_component.dart';
import 'package:request/request_component.dart';
import 'package:object_list/object_list_component.dart';
import 'package:contractor_list/contractor_list_component.dart';
import 'package:analytics/analytics_component.dart';
import 'package:object_budget/object_budget_component.dart';

import '../breadcrumb_component.dart';

@Component(selector: 'master')
@View(
    templateUrl: 'master_component.html',
    directives: const [RouterLink, AlertComponent, RouterOutlet, BreadcrumbComponent])
@RouteConfig(const [
  ContractComponent.route,
  DashboardComponent.route,
  ContractListComponent.route,
  ObjectBudgetListComponent.route,
  PaymentBudgetListComponent.route,
  RequestListComponent.route,
  RequestComponent.route,
  ObjectListComponent.route,
  ObjectBudgetComponent.route,
  ContractorListComponent.route,
  AnalyticsComponent.route
])
class MasterComponent implements AfterViewInit {
  static const String route_name = "Master";
  static const String route_path = "master/...";
  static const Route route = const Route(
      path: MasterComponent.route_path,
      component: MasterComponent,
      name: MasterComponent.route_name,
      useAsDefault: true);

  final AlertService _alertService;
  final Router _router;

  MasterComponent(this._alertService, this._router) {}

  @override
  void ngAfterViewInit() {
    var script = new ScriptElement()
      ..async = true
      ..type = 'text/javascript'
      ..src = 'assets/js/app.js';
    document.body.append(script);
  }
}
