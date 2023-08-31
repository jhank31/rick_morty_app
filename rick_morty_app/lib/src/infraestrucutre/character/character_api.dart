import 'package:rick_morty_app/src/constants/constants.dart';
import 'package:rick_morty_app/src/domain/character/interface/i_character.dart';
import 'package:rick_morty_app/src/domain/character/model/character_model.dart';
import 'package:rick_morty_app/src/domain/entities/entities.dart';

class CharacterApi extends ICharacter {
  @override
  Future<List<CharacterModel>> getCharacters() async {
    List<Map<String, dynamic>> characters = await getAllEntities(
        "${Constants.baseURL}${Constants.characterEndpoint}");
    return List<CharacterModel>.from(
        characters.map((e) => CharacterModel.fromJson(e)));
  }

 
}
