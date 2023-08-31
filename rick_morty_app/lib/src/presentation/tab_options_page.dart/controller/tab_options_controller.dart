// ignore_for_file: prefer_final_fields, avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'package:fuzzywuzzy/fuzzywuzzy.dart';
import 'package:get/get.dart';
import 'package:rick_morty_app/src/presentation/exports/export_controllers.dart';
import 'package:rick_morty_app/src/presentation/exports/export_pages.dart';

class TabOptionsController extends GetxController {
  final characterController = Get.find<CharacterController>();
  final episodesController = Get.find<EpisodesController>();
  final locationController = Get.find<LocationController>();
  RxMap allItems = {'character': [], 'episodes': [], 'location': []}.obs;
  RxList searchResults = [].obs;

  RxList<Widget> listPages =
      [const CharacterPage(), const LocationPage(), const EpisodesPage()].obs;
  RxList<Widget> listNavigationBar = [
    const NavigationDestination(
      selectedIcon: Icon(Icons.person_pin_circle_outlined),
      icon: Icon(Icons.person_pin_circle_outlined),
      label: 'Personajes',
    ),
    const NavigationDestination(
      selectedIcon: Icon(Icons.location_on_outlined),
      icon: Icon(Icons.location_on_outlined),
      label: 'Ubicaciones',
    ),
    const NavigationDestination(
      selectedIcon: Icon(Icons.book_online_outlined),
      icon: Icon(Icons.book_online_outlined),
      label: 'Episodios',
    )
  ].obs;
  RxInt _currentPage = 0.obs;
  final PageController _pageController = PageController();

  get currentPage => _currentPage;
  get pageController => _pageController;

  set currentPage(value) {
    _pageController.jumpToPage(
      value,
    );
    _currentPage.value = value;
  }

  List updateResults(String query) {
    List lista = [];
    allItems.values.forEach((values) {
      values.forEach((value) {
        int similarity = tokenSortRatio(value.name, query);
        if (similarity > 1) {
          bool alreadyExists = lista.any((entry) => entry['item'] == value);
          if (!alreadyExists) {
            lista.add({'item': value, 'similarity': similarity});
          }
        }
      });
    });

    lista.sort((a, b) => b['similarity'].compareTo(a['similarity']));
    return lista.map((entry) => entry['item']).take(20).toList();
  }

  Future<void> initAllData() async {
    await characterController.getAllCharacters();
    await episodesController.getAllEpisodes();
    await locationController.getAllLocations();
    if (characterController.allCharacters.isNotEmpty) {
      for (var element in characterController.allCharacters) {
        allItems['character'].add(element);
      }
    }
    if (episodesController.allEpisodes.isNotEmpty) {
      for (var element in episodesController.allEpisodes) {
        allItems['episodes'].add(element);
      }
    }
    if (locationController.allLocatinos.isNotEmpty) {
      for (var element in locationController.allLocatinos) {
        allItems['location'].add(element);
      }
    }
  }

  static TabOptionsController get findOrInitialize {
    try {
      return Get.find<TabOptionsController>();
    } catch (e) {
      Get.put(TabOptionsController());
      return Get.find<TabOptionsController>();
    }
  }
}
