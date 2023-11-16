import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_mapper/app/photo_details/bloc/photo_places_state.dart';
import 'package:photo_mapper/core/core.dart';

class PhotoPlacesCubit extends Cubit<PhotoPlacesState> {
  PhotoPlacesCubit(this._getPlacesUsecase) : super(InitialState());

  final GetPlacesUseCase _getPlacesUsecase;

  Future initialize() async {
    emit(LoadingState());
    final record = await _getPlacesUsecase.call();
    final error = record.$2;
    final photos = record.$1;
    if (error.isNotEmpty) return emit(ErrorState(record.$2));
    if (photos.isEmpty) return emit(EmptyState());
    return emit(PlacesLoaded(photos));
  }
}
