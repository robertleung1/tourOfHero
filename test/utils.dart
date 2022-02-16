import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:mockito/mockito.dart';

class InjectorProbe {
  InjectorFactory _parent;
  Injector _injector;

  InjectorProbe(this._parent);

  InjectorFactory get factory => _factory;
  Injector get injector => _injector ??= _factory();

  Injector _factory([Injector parent]) => _injector = _parent(parent);
  T get<T>(dynamic token) => injector?.get(token);
}

class MockPlatformLocation extends Mock implements PlatformLocation {
  String _url;

  String get hash => '';
  String get pathname => _url ?? '';
  String get search => '';

  void pushState(state, String title, String url) => _url = url;
}

const /* List<Provider|List<Provider>> */ routerProvidersForTesting = [
  ValueProvider.forToken(appBaseHref, '/'),
  routerProviders,
  // Mock platform location even with real router, otherwise sometimes tests hang.
  ClassProvider(PlatformLocation, useClass: MockPlatformLocation),
];
