import 'package:photo_mapper/core/core.dart';
import 'package:photo_mapper/core/usecase/use_case.dart';
import 'package:photo_mapper/data/data.dart';

class SavePhotoUsecase extends BaseUseCase<bool, PhotoEntity> {
  final PhotoRepo repo;

  SavePhotoUsecase(this.repo);

  @override
  Future<bool> call({PhotoEntity? params}) {
    return repo.savePhoto(params!);
  }
}
