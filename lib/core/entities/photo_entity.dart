import 'package:photo_mapper/core/core.dart';

class PhotoEntity {
  final String id;
  final String name;
  final String imageUrl;
  final List<PlaceEntity> places;

  PhotoEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.places,
  });
}
