import 'package:rick_morty_app/src/domain/location/model/location_model.dart';

abstract class ILocation {
  Future<List<LocationModel>> getLocations();
}
