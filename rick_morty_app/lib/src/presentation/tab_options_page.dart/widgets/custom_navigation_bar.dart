import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_morty_app/src/presentation/exports/export_controllers.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final TabOptionsController tabOptionsController =
        Get.find<TabOptionsController>();
    return Obx(
      () => NavigationBar(
        backgroundColor: Colors.black,
        indicatorColor: Colors.green,
        selectedIndex: tabOptionsController.currentPage.value,
        onDestinationSelected: (value) =>
            tabOptionsController.currentPage = value,
        destinations: tabOptionsController.listNavigationBar,
      ),
    );
  }
}
