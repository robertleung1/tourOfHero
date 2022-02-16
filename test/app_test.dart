@TestOn('browser')
import 'package:angular/angular.dart';
import 'package:angular_test/angular_test.dart';
import 'package:angular_router/angular_router.dart';
import 'package:tourOfHero/app_component.dart';
import 'package:tourOfHero/app_component.template.dart' as ng;
import 'package:ngpageloader/html.dart';
import 'package:test/test.dart';

import 'app_test.template.dart' as self;
import 'app_po.dart';
import 'utils.dart';

// Testing info: https://angulardart.xyz/guide/testing

@GenerateInjector(routerProvidersForTesting)
final InjectorFactory rootInjector = self.rootInjector$Injector;

void main() {
  final injector = InjectorProbe(rootInjector);
  final testBed = NgTestBed<AppComponent>(ng.AppComponentNgFactory,
      rootInjector: injector.factory);

  NgTestFixture<AppComponent> fixture;
  AppPO appPO;
  Router router;

  setUp(() async {
    fixture = await testBed.create();
    router = injector.get<Router>(Router);
    await router.navigate('/');
    await fixture.update();
    final context =
        HtmlPageLoaderElement.createFromElement(fixture.rootElement);
    appPO = AppPO.create(context);
  });

  tearDown(disposeAnyRunningTest);

  test("Title is 'Tour of Heroes'", () {
    expect(appPO.title, 'Tour of Heroes');
  });
}
