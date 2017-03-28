import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import 'package:alert/alert_service.dart';
import 'package:alert/alert_component.dart';

import 'package:contracts/contracts_component.dart';
import 'package:dashboard/dashboard_component.dart';
import 'package:object_budget_list/object_budget_list_component.dart';
import 'package:payment_budget_list/payment_budget_list_component.dart';
import 'package:requests/requests_component.dart';
import 'package:object_list/object_list_component.dart';
import 'package:contractor_list/contractor_list_component.dart';
import 'package:analytics/analytics_component.dart';
import 'package:object_budget/object_budget_component.dart';
import 'package:master_layout/master_layout_component.dart';

@Component(selector: 'master')
@View(
    templateUrl: 'master_component.html',
    directives: const [
      RouterLink,
      AlertComponent,
      RouterOutlet,
      MasterLayoutComponent])
@RouteConfig(const [
const Route(
    path: 'contracts/...',
    component: ContractsComponent,
    name: 'Contracts'),
  DashboardComponent.route,
  ObjectBudgetListComponent.route,
  PaymentBudgetListComponent.route,
const Route(
  path: 'requests/...',
  component: ContractsComponent,
  name: 'Requests'),
  ObjectListComponent.route,
  ObjectBudgetComponent.route,
  ContractorListComponent.route,
  AnalyticsComponent.route])
class MasterComponent {
  static const String route_name = 'Master';
  static const String route_path = '/...';
  static const Route route = const Route(
      path: MasterComponent.route_path,
      component: MasterComponent,
      name: MasterComponent.route_name,
      useAsDefault: true);

  final AlertService _alertService;
  final Router _router;

  MasterComponent(this._alertService, this._router) {}
}
