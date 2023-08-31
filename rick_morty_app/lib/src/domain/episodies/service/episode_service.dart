import 'package:rick_morty_app/src/domain/episodies/interface/i_episode.dart';
import 'package:rick_morty_app/src/domain/episodies/model/episode_model.dart';

class EpisodeServise {
  final IEpisode episode;

  EpisodeServise(this.episode);

  Future<List<EpisodeModel>> getEpisodes() {
    return episode.getEpisodes();
  }
}
