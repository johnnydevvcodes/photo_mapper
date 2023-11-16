import 'package:photo_mapper/core/core.dart';
import 'package:photo_mapper/core/usecase/use_case.dart';
import 'package:photo_mapper/data/data.dart';

class UploadPhotoUsecase extends BaseUseCase<(PhotoEntity, String), int> {
  final PhotoRepo repo;

  UploadPhotoUsecase(this.repo);

  @override
  Future<(PhotoEntity, String)> call({int? params}) {
    return repo.uploadPhoto();
  }
}
