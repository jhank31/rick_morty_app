import 'package:rick_morty_app/src/domain/character/interface/i_character.dart';
import 'package:rick_morty_app/src/domain/character/model/character_model.dart';

class CharacterService {
  final ICharacter character;
  CharacterService(this.character);

  Future<List<CharacterModel>> getCharacters() {
    return character.getCharacters();
  }
}
