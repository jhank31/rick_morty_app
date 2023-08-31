import 'package:rick_morty_app/src/domain/character/model/character_model.dart';

abstract class ICharacter {
  Future<List<CharacterModel>> getCharacters();
}
