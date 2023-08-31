import 'package:rick_morty_app/src/domain/episodies/model/episode_model.dart';

abstract class IEpisode {
  Future<List<EpisodeModel>> getEpisodes();
}
