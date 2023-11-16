import 'package:photo_mapper/core/core.dart';
import 'package:photo_mapper/core/usecase/use_case.dart';
import 'package:photo_mapper/data/data.dart';

class GetPhotosUsecase extends BaseUseCase<(List<PhotoEntity>, String), int> {
  final PhotoRepo repo;

  GetPhotosUsecase(this.repo);

  @override
  Future<(List<PhotoEntity>, String)> call({int? params}) {
    return repo.getPhotos(offset: params);
  }
}
