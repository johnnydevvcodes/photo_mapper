import 'package:photo_mapper/core/core.dart';

abstract class PlaceService {
  Future<(List<PlaceEntity>, String error)> getNearbyPlaces();
}

class PlaceServiceImpl extends PlaceService {

  @override
  Future<(List<PlaceEntity>, String error)> getNearbyPlaces() async {
    //parse a mock data
    return Future.value((<PlaceEntity>[], ''));
  }
}
