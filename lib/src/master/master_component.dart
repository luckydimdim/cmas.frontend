import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import 'package:alert/alert_component.dart';

import 'package:contracts/contracts_component.dart';
//import 'package:dashboard/dashboard_component.dart';
//import 'package:object_budget_list/object_budget_list_component.dart';
//import 'package:payment_budget_list/payment_budget_list_component.dart';
import 'package:requests/requests_component.dart';
//import 'package:object_list/object_list_component.dart';
//import 'package:contractor_list/contractor_list_component.dart';
//import 'package:analytics/analytics_component.dart';
//import 'package:object_budget/object_budget_component.dart';
import 'package:master_layout/master_layout_component.dart';
import 'package:administration/administration_component.dart';

@Component(
    selector: 'master',
    templateUrl: 'master_component.html',
    directives: const [
      RouterLink,
      AlertComponent,
      RouterOutlet,
      MasterLayoutComponent
    ])
@RouteConfig(const [
  const Route(
      path: 'contracts/...',
      component: ContractsComponent,
      name: 'Contracts',
      useAsDefault: true,
      data: ContractsComponent.DisplayName),
  //DashboardComponent.route,
  //ObjectBudgetListComponent.route,
  //PaymentBudgetListComponent.route,
  const Route(
      path: 'requests/...',
      component: RequestsComponent,
      name: 'Requests',
      data: RequestsComponent.DisplayName),
  //ObjectListComponent.route,
  //ObjectBudgetComponent.route,
  //ContractorListComponent.route,
  //AnalyticsComponent.route,
  const Route(
      path: 'administration/...',
      component: AdministrationComponent,
      name: 'Administration',
      data: AdministrationComponent.DisplayName)
])
class MasterComponent {
  MasterComponent() {}
}
