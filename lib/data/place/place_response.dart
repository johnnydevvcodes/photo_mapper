import 'package:dart_mappable/dart_mappable.dart';
import 'package:photo_mapper/core/core.dart';

part 'place_response.mapper.dart';

@MappableClass()
class PlaceResponse extends PlaceEntity with PlaceResponseMappable {
  PlaceResponse({
    required super.id,
    required super.name,
    required super.imageUrl,
  });
}

extension UsersToEntities on List<PlaceResponse> {
  List<PlaceEntity> get toEntities {
    final entities = <PlaceEntity>[];
    final uniqueIds = [];
    for (final user in this) {
      if (uniqueIds.contains(user.id)) continue;
      entities.add(PlaceEntity(
        id: user.id,
        name: user.name,
        imageUrl: user.imageUrl,
      ));
      uniqueIds.add(user.id);
    }
    return entities;
  }
}
