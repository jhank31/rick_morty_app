import 'package:rick_morty_app/src/constants/constants.dart';
import 'package:rick_morty_app/src/domain/entities/entities.dart';
import 'package:rick_morty_app/src/domain/location/interface/i_location.dart';
import 'package:rick_morty_app/src/domain/location/model/location_model.dart';

class LocationApi extends ILocation {
  @override
  Future<List<LocationModel>> getLocations() async {
    List<Map<String, dynamic>> episodes = await getAllEntities(
        "${Constants.baseURL}${Constants.locationEndpoint}");

    return List<LocationModel>.from(
        episodes.map((e) => LocationModel.fromJson(e)));
  }
}
