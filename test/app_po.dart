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

  // Retrieve all hero data from the hero list shown on the html page
  Iterable<Map> get heroes =>
      _heroes.map((el) => _heroDataFromLi(el.visibleText));

  // Parse hero data from input string and return it as an Map object: {id: name}
  Map<String, dynamic> _heroDataFromLi(String liText) {
    final matches = RegExp((r'^(\d+) (.*)$')).firstMatch(liText);
    return _heroData(matches[1], matches[2]);
  }

  // Return hero info as an Map object: {id: name}
  // if idAsString is null, id will be set to '-1'
  //
  // Note: signature of the method should be _heroData(String? idAsString, String? name),
  // however, the current configuration triggered an syntax error of 'non-nullable' language
  // feature not enabled.
  Map<String, dynamic> _heroData(String idAsString, String name) =>
      {'id': int.parse(idAsString ?? '-1'), 'name': name};
}
