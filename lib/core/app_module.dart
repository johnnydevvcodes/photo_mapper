import 'package:flutter_modular/flutter_modular.dart';
import 'package:photo_mapper/app/dashboard/bloc/photo_gallery_cubit.dart';
import 'package:photo_mapper/core/app_db.dart';
import 'package:photo_mapper/core/core.dart';
import 'package:photo_mapper/data/data.dart';
import 'package:photo_mapper/data/photo/photo_dao.dart';
import 'package:photo_mapper/data/photo/photo_service.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    //core layer
    i.add<AppDatabase>(AppDatabaseImpl.new);
    i.add(GetPhotosUsecase.new);
    i.add(UploadPhotoUsecase.new);

    //app layer
    i.add(PhotoGalleryCubit.new);


    //data layer
    i.add(PhotoDao.new);
    i.add(PhotoService.new);
    i.add<PlaceService>(PlaceServiceImpl.new);
    i.add<PhotoRepo>(PhotoRepoImpl.new);
  }
}
