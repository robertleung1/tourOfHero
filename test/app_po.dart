import 'dart:async';

import 'package:ngpageloader/pageloader.dart';

part 'app_po.g.dart';

@PageObject()
abstract class AppPO {
  AppPO();
  factory AppPO.create(PageLoaderElement context) = $AppPO.create;

  @ByTagName('h1')
  PageLoaderElement get _title;

  String get title => _title.visibleText;

  @ByTagName('li')
  List<PageLoaderElement> get _heroes;

  Iterable<Map> get heroes =>
      _heroes.map((el) => _heroDataFromLi(el.visibleText));

  // ···
  Map<String, dynamic> _heroDataFromLi(String liText) {
    final matches = RegExp((r'^(\d+) (.*)$')).firstMatch(liText);
    return _heroData(matches[1], matches[2]);
  }

  Map<String, dynamic> _heroData(String idAsString, String name) =>
      {'id': int.parse(idAsString ?? '-1'), 'name': name};
}
