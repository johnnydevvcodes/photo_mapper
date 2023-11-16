import 'package:photo_mapper/core/core.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'photo_response.mapper.dart';

@MappableClass()
class PhotoResponse extends PhotoEntity with PhotoResponseMappable {
  PhotoResponse({
    required super.id,
    required super.name,
    required super.imageUrl,
    required super.places,
  });
}
