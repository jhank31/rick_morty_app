import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';
import 'package:rick_morty_app/src/presentation/exports/export_controllers.dart';
import 'package:rick_morty_app/src/presentation/exports/export_pages.dart';
import 'package:rick_morty_app/src/theme/theme.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({
    super.key,
    required this.isPortrait,
  });

  final bool isPortrait;

  @override
  Widget build(BuildContext context) {
    final tabController = Get.find<TabOptionsController>();
    return FloatingSearchBar(
      hint: 'Buscar...',
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 500),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      axisAlignment: isPortrait ? 0.0 : -1.0,
      openAxisAlignment: 0.0,
      width: isPortrait ? 600 : 500,
      debounceDelay: const Duration(milliseconds: 500),
      onQueryChanged: (query) {
        tabController.searchResults
            .assignAll(tabController.updateResults(query));
      },
      // Specify a custom transition to be used for
      // animating between opened and closed stated.
      transition: CircularFloatingSearchBarTransition(),
      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: CircularButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ),
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
      ],
      builder: (context, transition) {
        return Obx(() => tabOptionsController.searchResults.isNotEmpty
            ? ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    ...List.generate(tabOptionsController.searchResults.length,
                        (index) {
                      return Container(
                        color: ThemeConfig.darkPrimary,
                        child: Column(
                          children: [
                            ListTile(
                              onTap: () => validarOnTap(
                                  tabOptionsController
                                      .searchResults[index].typeModel,
                                  tabOptionsController.searchResults[index]),
                              title: Text(tabOptionsController
                                  .searchResults[index].name
                                  .toString()),
                              subtitle: returnSubTitle(tabOptionsController
                                  .searchResults[index].typeModel),
                            ),
                            const Divider()
                          ],
                        ),
                      );
                    }),
                  ],
                )),
              )
            : const SizedBox.shrink());
      },
    );
  }

  void validarOnTap(typeModel, model) {
    switch (typeModel) {
      case "character":
        Get.toNamed("/detailCharacter", arguments: model);
        break;
      case "episode":
        Get.toNamed("/detailEpisodeLocation", arguments: [model, typeModel]);
        break;
      case "location":
        Get.toNamed("/detailEpisodeLocation", arguments: [model, typeModel]);
        break;
      default:
    }
  }

  Widget returnSubTitle(model) {
    switch (model) {
      case "character":
        return const Text(
          "Personaje",
        );

      case "episode":
        return const Text("Episodio");

      case "location":
        return const Text("Ubicacion");
    }
    return const Text('');
  }
}
