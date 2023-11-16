import 'dart:convert';

import 'package:photo_mapper/core/core.dart';
import 'package:photo_mapper/data/data.dart';

abstract class PlaceRepo {
  Future<(List<PlaceEntity>, String error)> getPlaces({int? offset});
}

class PlaceRepoImpl extends PlaceRepo {
  PlaceRepoImpl(this.client);

  final PlaceService client;

  @override
  Future<(List<PlaceEntity>, String error)> getPlaces({int? offset}) async {
    try {
      final rawPlaces = await client.getPlaces();
      final decodedPlaces = jsonDecode(rawPlaces.toString()) as List;
      mapper(e) => PlaceResponseMapper.fromMap(e);
      final places = decodedPlaces.map(mapper).toList();
      // return (Places.toEntities, '');
      return (places, '');
    } catch (e) {
      return (<PlaceEntity>[], e.toString());
    }
  }
}
