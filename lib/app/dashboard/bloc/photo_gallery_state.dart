import 'package:photo_mapper/core/core.dart';

sealed class PhotoGalleryState {}

class PhotosLoaded extends PhotoGalleryState {
  PhotosLoaded(this.photos);
  final List<PhotoEntity> photos;
}

class ErrorState extends PhotoGalleryState {
  ErrorState(this.error);
  final String error;
}

class UploadErrorState extends PhotoGalleryState {
  UploadErrorState(this.error);
  final String error;
}

class UploadedPhotoState extends PhotoGalleryState {
  UploadedPhotoState(this.photo);
  final PhotoEntity photo;
}

class SavedPhotoState extends PhotoGalleryState {}

class EmptyState extends PhotoGalleryState {}

class InitialState extends PhotoGalleryState {}

class LoadingState extends PhotoGalleryState {}
