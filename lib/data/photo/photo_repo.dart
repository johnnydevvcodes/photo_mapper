import 'dart:async';

import 'package:image_picker/image_picker.dart';
import 'package:native_exif/native_exif.dart';
import 'package:photo_mapper/core/core.dart';
import 'package:photo_mapper/data/photo/photo_dao.dart';
import 'package:photo_mapper/data/photo/photo_response.dart';
import 'package:photo_mapper/data/photo/photo_service.dart';

abstract class PhotoRepo {
  Future<(List<PhotoEntity>, String)> getPhotos({int? offset});
  Future<(PhotoEntity, String)> uploadPhoto();
  Future savePhoto(PhotoEntity entity);
}

class PhotoRepoImpl extends PhotoRepo {
  PhotoRepoImpl(this.dao, this.service);

  final PhotoDao dao;
  final PhotoService service;

  @override
  Future<(List<PhotoEntity>, String)> getPhotos({int? offset}) async {
    PhotoEntity toEntity(c) => PhotoResponseMapper.fromJson(c.value as dynamic);
    try {
      final rawPhotos = List.from(await dao.getRecords());
      rawPhotos.removeWhere((rc) => rc.value == null);
      final photos = rawPhotos.map(toEntity).toList();
      return (photos, '');
    } catch (e) {
      return (<PhotoEntity>[], e.toString());
    }
  }

  @override
  Future savePhoto(PhotoEntity entity) {
    final rawPhoto = PhotoResponse(
      id: entity.id,
      name: entity.name,
      imageUrl: entity.imageUrl,
      places: entity.places,
    );
    return dao.save(rawPhoto.toMap());
  }

  @override
  Future<(PhotoEntity, String)> uploadPhoto() async {
    XFile? file = await service.takePhoto();
    final exif = await Exif.fromPath(file!.path);
    return (
      PhotoEntity(
        id: '1',
        name: file.name,
        imageUrl: '',
        places: [],
      ),
      ''
    );
  }
}
