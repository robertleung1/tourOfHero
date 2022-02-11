import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'hero.dart';
import 'mock_heroes.dart';
import 'hero_component.dart';
import 'hero_service.dart';

// AngularDart info: https://angulardart.xyz
// Components info: https://angulardart.xyz/components
//
// (If the links still point to the old Dart-lang repo, go here:
// https://pub.dev/ngcomponents)

@Component(
  selector: 'my-heros',
  styleUrls: ['hero_list_component.css'],
  templateUrl: 'hero_list_component.html',
  directives: [coreDirectives, HeroComponent],
  providers: [ClassProvider(HeroService)],
)
class HeroListComponent implements OnInit {
  final title = 'Tour of Heroes';
  final HeroService _heroService;
  List<Hero> heroes;
  Hero selected;

  HeroListComponent(this._heroService);

  void onSelect(Hero hero) => selected = hero;

  void _getHeroes() async {
    heroes = await _heroService.getAll();
  }

  void ngOnInit() => _getHeroes();
}
