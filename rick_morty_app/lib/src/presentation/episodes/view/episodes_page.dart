import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:rick_morty_app/src/presentation/exports/export_controllers.dart';
import 'package:rick_morty_app/src/shared/export_widgets.dart';

class EpisodesPage extends StatelessWidget {
  const EpisodesPage({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final episodesController = Get.find<EpisodesController>();
    return Scaffold(
        body: SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Obx(
        () => episodesController.allEpisodes.isEmpty
            ? const Center(
                child: SpinKitDancingSquare(
                color: Colors.green,
              ))
            : CustomList(
                listData: episodesController.allEpisodes,
                type: 'episode',
              ),
      ),
    ));
  }
}
