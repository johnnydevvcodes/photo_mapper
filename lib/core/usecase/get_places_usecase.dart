import 'package:photo_mapper/core/core.dart';
import 'package:photo_mapper/core/usecase/use_case.dart';
import 'package:photo_mapper/data/data.dart';

class GetPlacesUseCase extends BaseUseCase<(List<PlaceEntity>, String), int> {
  final PlaceRepo repo;

  GetPlacesUseCase(this.repo);
  @override
  Future<(List<PlaceEntity>, String)> call({int? params}) {
    return repo.getPlaces(offset: params);
  }
}
