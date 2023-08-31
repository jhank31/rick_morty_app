import 'package:get/get.dart';
import 'package:rick_morty_app/src/domain/character/service/character_service.dart';
import 'package:rick_morty_app/src/infraestrucutre/character/character_api.dart';

class CharacterController extends GetxController {
  final characterService = CharacterService(CharacterApi());
  RxList allCharacters = [].obs;

  Future<void> getAllCharacters() async {
    var tempList = await characterService.getCharacters();
    allCharacters.assignAll(tempList);
  }

  static CharacterController get findOrInitialize {
    try {
      return Get.find<CharacterController>();
    } catch (e) {
      Get.put(CharacterController());
      return Get.find<CharacterController>();
    }
  }
}
