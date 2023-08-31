import 'package:rick_morty_app/src/constants/constants.dart';
import 'package:rick_morty_app/src/domain/entities/entities.dart';
import 'package:rick_morty_app/src/domain/episodies/interface/i_episode.dart';
import 'package:rick_morty_app/src/domain/episodies/model/episode_model.dart';

class EpisodeApi extends IEpisode {
  @override
  Future<List<EpisodeModel>> getEpisodes() async {
    List<Map<String, dynamic>> episodes = await getAllEntities(
        "${Constants.baseURL}${Constants.episodeEndpoint}");

    return List<EpisodeModel>.from(
        episodes.map((e) => EpisodeModel.fromJson(e)));
  }
}
