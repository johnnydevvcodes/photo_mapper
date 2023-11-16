import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_mapper/app/dashboard/bloc/photo_gallery_cubit.dart';
import 'package:photo_mapper/app/dashboard/bloc/photo_gallery_state.dart';
import 'package:photo_mapper/app/dashboard/widgets/photo_item_widget.dart';
import 'package:gap/gap.dart';
import 'package:photo_mapper/app/photo_details/screens/photo_details_screen.dart';

class PhotoGalleryScreen extends StatefulWidget {
  const PhotoGalleryScreen({Key? key}) : super(key: key);

  @override
  State<PhotoGalleryScreen> createState() => _PhotoGalleryScreenState();
}

class _PhotoGalleryScreenState extends State<PhotoGalleryScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PhotoGalleryCubit>().initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Photo Mapper')),
      body: BlocConsumer<PhotoGalleryCubit, PhotoGalleryState>(
        listener: (BuildContext context, PhotoGalleryState state) {
          if (state is UploadErrorState) {}
          if (state is UploadedPhotoState) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PhotoDetailScreen(state.photo),
              ),
            );
          }
        },
        buildWhen: (previous, state) {
          return state is! UploadErrorState || state is! UploadedPhotoState;
        },
        builder: (context, state) {
          switch (state) {
            case ErrorState():
              return Center(child: Text(state.error));
            case EmptyState():
              return Center(
                child: Text(
                  'Hello Welcome!'
                  '\nPlease add some photos.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              );
            case InitialState():
            case LoadingState():
              return const Center(child: CircularProgressIndicator.adaptive());
            case PhotosLoaded():
              return RefreshIndicator(
                onRefresh: context.read<PhotoGalleryCubit>().initialize,
                child: ListView.builder(
                  itemCount: state.photos.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        if (index == 0) const Gap(16),
                        PhotoItemWidget(state.photos[index]),
                      ],
                    );
                  },
                ),
              );
            default:
              return const SizedBox();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(82, 170, 94, 1.0),
        tooltip: 'Increment',
        onPressed: () {
          //upload a photo
          context.read<PhotoGalleryCubit>().uploadPhoto();
        },
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
    );
  }
}
