import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:tourOfHero/app_component.template.dart' as ng;
import 'package:tourOfHero/in_memory_data_service.dart';
import 'package:http/http.dart';
//import 'package:http/browser_client.dart';

import 'main.template.dart' as self;

@GenerateInjector([
  routerProvidersHash, // You can use routerProviders in production
  //ClassProvider(BrowserClient),
  ClassProvider(Client, useClass: InMemoryDataService),
])
final InjectorFactory injector = self.injector$Injector;

void main() {
  runApp(ng.AppComponentNgFactory, createInjector: injector);
}
