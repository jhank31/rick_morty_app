// ignore_for_file: override_on_non_overriding_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_morty_app/src/presentation/exports/export_controllers.dart';
import 'package:rick_morty_app/src/presentation/tab_options_page.dart/widgets/widgets_tab_options.dart';
import 'package:rick_morty_app/src/shared/export_widgets.dart';

class TabOptionsPage extends StatefulWidget {
  const TabOptionsPage({key}) : super(key: key);

  @override
  State<TabOptionsPage> createState() => _TabOptionsPageState();
}

final TabOptionsController tabOptionsController =
    Get.find<TabOptionsController>();

class _TabOptionsPageState extends State<TabOptionsPage> {
  @override
  void initState() {
    tabOptionsController.initAllData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return SafeArea(
      top: true,
      child: Scaffold(
        body: Stack(
          children: [
            const BodyTabPage(),
            CustomSearch(isPortrait: isPortrait)
          ],
        ),
        bottomNavigationBar: const CustomNavigationBar(),
      ),
    );
  }
}
