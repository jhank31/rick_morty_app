import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:rick_morty_app/src/presentation/character/view/widgets/detail_character.dart';
import 'package:rick_morty_app/src/presentation/exports/export_pages.dart';
import 'package:rick_morty_app/src/shared/export_widgets.dart';

class AppRoutes {
  static final routes = [
    GetPage(name: "/tabOptionsPage", page: () => const TabOptionsPage()),
    GetPage(name: "/characterPage", page: () => const CharacterPage()),
    GetPage(name: "/locationPage", page: () => const LocationPage()),
    GetPage(name: "/episodesPage", page: () => const EpisodesPage()),
    GetPage(name: "/detailCharacter", page: () => const DetailCharacter()),
    GetPage(name: "/detailEpisodeLocation", page: () => const DetailEpisodeLocation()),
  ];
}
