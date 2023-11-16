import 'package:flutter/services.dart';

abstract class PlaceService {
  Future<String> getPlaces();
}

class PlaceServiceImpl extends PlaceService {
  @override
  Future<String> getPlaces() async {
    //parse a mock data
    final rawPlaces = await rootBundle.loadString('assets/places.json');
    return rawPlaces;
  }
}
