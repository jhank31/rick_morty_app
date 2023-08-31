import 'package:get/get.dart';
import 'package:rick_morty_app/src/domain/episodies/service/episode_service.dart';
import 'package:rick_morty_app/src/infraestrucutre/episode/episode_api.dart';

class EpisodesController extends GetxController {
  final characterService = EpisodeServise(EpisodeApi());
  RxList allEpisodes = [].obs;

  Future<void> getAllEpisodes() async {
    var tempList = await characterService.getEpisodes();
    allEpisodes.assignAll(tempList);
  }

  static EpisodesController get findOrInitialize {
    try {
      return Get.find<EpisodesController>();
    } catch (e) {
      Get.put(EpisodesController());
      return Get.find<EpisodesController>();
    }
  }
}