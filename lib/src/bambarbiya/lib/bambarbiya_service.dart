import 'dart:html';
import 'dart:async';
import 'dart:core';

import 'package:angular2/angular2.dart';

import 'package:resources_loader/resources_loader.dart';

@Injectable()
class BambarbiyaService {
  ResourcesLoaderService _resourcesLoader;

  BambarbiyaService(this._resourcesLoader) { }

  void kergudu() {
    _resourcesLoader.loadStyle(
      '/vendor/font-awesome/css/', 'font-awesome.min.css');
    _resourcesLoader.loadStyle(
      '/vendor/simple-line-icons/css/', 'simple-line-icons.css');
    _resourcesLoader.loadStyle(
      '/packages/bambarbiya/assets/', 'style.css');


    _resourcesLoader.loadScript(
      '/vendor/jquery/dist/', 'jquery.min.js', false);
    _resourcesLoader.loadScript(
      '/vendor/tether/dist/js/', 'tether.min.js', false);
    _resourcesLoader.loadScript(
      '/vendor/bootstrap/dist/js/', 'bootstrap.min.js', false);
    _resourcesLoader.loadScript(
      '/vendor/PACE/', 'pace.min.js', false);
  }

  Future ailyulyu() async {
    String template = await HttpRequest.getString("/packages/bambarbiya/bambarbiya.html");
    document.body.setInnerHtml(template, treeSanitizer: NodeTreeSanitizer.trusted);
  }
}