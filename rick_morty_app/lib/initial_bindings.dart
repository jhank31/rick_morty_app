import 'package:get/get.dart';
import 'package:rick_morty_app/src/presentation/exports/export_controllers.dart';

class InitialBindings extends Bindings {
  @override
  Future<void> dependencies() async {
    CharacterController.findOrInitialize;
    EpisodesController.findOrInitialize;
    LocationController.findOrInitialize;
    TabOptionsController.findOrInitialize;
  }
}
