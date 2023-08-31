import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_morty_app/src/presentation/exports/export_controllers.dart';

class BodyTabPage extends StatelessWidget {
  const BodyTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TabOptionsController tabOptionsController =
        Get.find<TabOptionsController>();
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: PageView(
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (value) => tabOptionsController.currentPage = value,
        controller: tabOptionsController.pageController,
        children: tabOptionsController.listPages,
      ),
    );
  }
}
