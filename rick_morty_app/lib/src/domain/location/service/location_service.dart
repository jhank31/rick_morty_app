import 'package:rick_morty_app/src/domain/location/interface/i_location.dart';
import 'package:rick_morty_app/src/domain/location/model/location_model.dart';

class LocationService {
  final ILocation location;
  LocationService(this.location);

  Future<List<LocationModel>> getLocations() {
    return location.getLocations();
  }
}
