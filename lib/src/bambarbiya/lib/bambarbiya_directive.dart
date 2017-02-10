import 'package:angular2/core.dart';
import 'package:angular2/router.dart';
import 'dart:html';
import 'package:resources_loader/resources_loader.dart';

@Directive(selector: "[bambarbiya]")
class BambarbiyaDirective {
  TemplateRef _templateRef;
  ViewContainerRef _viewContainer;

  BambarbiyaDirective(this._templateRef, this._viewContainer);

  @Input()
  set bambarbiya(Map data) {
    _viewContainer.createEmbeddedView(_templateRef);
    /*if (data != null && data['active']) {
      _viewContainer.createEmbeddedView(_templateRef);
    } else {
      _viewContainer.clear();
    }*/


  }
}