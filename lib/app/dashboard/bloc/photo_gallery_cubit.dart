import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_mapper/app/dashboard/bloc/photo_gallery_state.dart';
import 'package:photo_mapper/core/core.dart';

class PhotoGalleryCubit extends Cubit<PhotoGalleryState> {
  PhotoGalleryCubit(
    this._getPhotosUsecase,
    this._uploadPhotoUsecase,
    this._savePhotoUsecase,
  ) : super(InitialState());

  final GetPhotosUsecase _getPhotosUsecase;
  final UploadPhotoUsecase _uploadPhotoUsecase;
  final SavePhotoUsecase _savePhotoUsecase;

  Future initialize() async {
    emit(LoadingState());
    final record = await _getPhotosUsecase.call();
    final error = record.$2;
    final photos = record.$1;
    if (error.isNotEmpty) return emit(ErrorState(record.$2));
    if (photos.isEmpty) return emit(EmptyState());
    return emit(PhotosLoaded(photos));
  }

  Future uploadPhoto() async {
    final record = await _uploadPhotoUsecase.call();
    final error = record.$2;
    if (error.isNotEmpty) return emit(UploadErrorState(record.$2));

    final photo = record.$1;
    emit(UploadedPhotoState(photo!));
  }

  Future savePhoto(PhotoEntity photo) async {
    emit(LoadingState());
    final isSaved = await _savePhotoUsecase.call(params: photo);
    if (isSaved) emit(SavedPhotoState());
  }
}
