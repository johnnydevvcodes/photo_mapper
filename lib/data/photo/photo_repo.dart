import 'dart:async';

import 'package:extended_image/extended_image.dart';
import 'package:geocoding/geocoding.dart';
import 'package:image_picker/image_picker.dart';
import 'package:native_exif/native_exif.dart';
import 'package:photo_mapper/core/core.dart';
import 'package:photo_mapper/data/photo/photo_dao.dart';
import 'package:photo_mapper/data/photo/photo_response.dart';
import 'package:photo_mapper/data/photo/photo_service.dart';
import 'package:uuid/uuid.dart';

abstract class PhotoRepo {
  Future<(List<PhotoEntity>, String)> getPhotos({int? offset});
  Future<(PhotoEntity?, String)> uploadPhoto();
  Future<bool> savePhoto(PhotoEntity entity);
}

class PhotoRepoImpl extends PhotoRepo {
  PhotoRepoImpl(this.dao, this.service);

  final PhotoDao dao;
  final PhotoService service;

  @override
  Future<(List<PhotoEntity>, String)> getPhotos({int? offset}) async {
    PhotoEntity toEntity(c) => PhotoResponseMapper.fromMap(c.value as dynamic);
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
  Future<bool> savePhoto(PhotoEntity entity) {
    final rawPhoto = PhotoResponse(
      id: entity.id,
      name: entity.name,
      imagePath: entity.imagePath,
      places: entity.places,
    );
    return dao.save(rawPhoto.toMap());
  }

  @override
  Future<(PhotoEntity?, String)> uploadPhoto() async {
    try {
      XFile? file = await service.getPhoto();
      final exif = await Exif.fromPath(file!.path);
      final gps = await exif.getLatLong();
      var places = <Placemark>[];
      String? address;
      if (gps != null) {
        places = await placemarkFromCoordinates(gps.latitude, gps.longitude);
        address = places.first.name;
      }

      return (
        PhotoEntity(
            id: const Uuid().v1(),
            name: address ?? file.name,
            imagePath: file.path,
            places: []),
        ''
      );
    } catch (e) {
      return (null, e.toString());
    }
  }
}
