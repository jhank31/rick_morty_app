import 'package:get/get.dart';
import 'package:rick_morty_app/src/domain/location/service/location_service.dart';
import 'package:rick_morty_app/src/infraestrucutre/location/location_api.dart';

class LocationController extends GetxController {
  final characterService = LocationService(LocationApi());
  RxList allLocatinos = [].obs;

  Future<void> getAllLocations() async {
    var tempList = await characterService.getLocations();
    allLocatinos.assignAll(tempList);
  }

  static LocationController get findOrInitialize {
    try {
      return Get.find<LocationController>();
    } catch (e) {
      Get.put(LocationController());
      return Get.find<LocationController>();
    }
  }
}
