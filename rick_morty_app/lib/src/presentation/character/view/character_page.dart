import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:rick_morty_app/src/presentation/character/view/widgets/custom_grid.dart';
import 'package:rick_morty_app/src/presentation/exports/export_controllers.dart';

class CharacterPage extends StatelessWidget {
  const CharacterPage({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final characterController = Get.find<CharacterController>();
    return Scaffold(
        body: SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Obx(
        () => characterController.allCharacters.isEmpty
            ? const Center(
                child: SpinKitDancingSquare(
                color: Colors.green,
              ))
            : CustomGrid(
                listToShow: characterController.allCharacters,
              ),
      ),
    ));
  }
}
