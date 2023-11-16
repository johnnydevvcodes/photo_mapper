import 'package:photo_mapper/core/core.dart';

sealed class PhotoPlacesState {}

class PlacesLoaded extends PhotoPlacesState {
  PlacesLoaded(this.photos);
  final List<PlaceEntity> photos;
}

class ErrorState extends PhotoPlacesState {
  ErrorState(this.error);
  final String error;
}


class EmptyState extends PhotoPlacesState {}

class InitialState extends PhotoPlacesState {}

class LoadingState extends PhotoPlacesState {}
