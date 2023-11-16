import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_mapper/app/dashboard/bloc/photo_gallery_state.dart';
import 'package:photo_mapper/core/core.dart';

class PhotoGalleryCubit extends Cubit<PhotoGalleryState> {
  PhotoGalleryCubit(
    this._getPhotosUsecase,
    this._uploadPhotoUsecase,
  ) : super(InitialState());

  final GetPhotosUsecase _getPhotosUsecase;
  final UploadPhotoUsecase _uploadPhotoUsecase;

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
    emit(LoadingState());
    final record = await _uploadPhotoUsecase.call();
    final error = record.$2;
    final photo = record.$1;
    if (error.isNotEmpty) return emit(UploadErrorState(record.$2));
    emit(UploadedPhotoState(photo));
  }
}
