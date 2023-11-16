import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_mapper/app/dashboard/bloc/photo_gallery_cubit.dart';
import 'package:photo_mapper/app/photo_details/widgets/photo_places_widget.dart';
import 'package:photo_mapper/core/core.dart';
import 'package:gap/gap.dart';

class PhotoDetailScreen extends StatefulWidget {
  final PhotoEntity photo;
  const PhotoDetailScreen(this.photo, {Key? key}) : super(key: key);

  @override
  State<PhotoDetailScreen> createState() => _PhotoDetailScreenState();
}

class _PhotoDetailScreenState extends State<PhotoDetailScreen> {
  var _taggedPlaces = <String>[];
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                final updatedPhoto = PhotoEntity(
                  id: widget.photo.id,
                  name: widget.photo.name,
                  imagePath: widget.photo.imagePath,
                  places: _taggedPlaces,
                );
                context.read<PhotoGalleryCubit>().savePhoto(updatedPhoto);
                Navigator.pop(context);
              },
              child: Text(
                "Save",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                height: 300,
                padding: const EdgeInsets.fromLTRB(24.0, 24, 24, 12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Image.file(
                        fit: BoxFit.cover,
                        File.fromUri(Uri.parse(widget.photo.imagePath)),
                      ),
                    ),
                    const Gap(12),
                    Text(
                      widget.photo.name,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SliverGap(24),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 18),
              child: Text(
                'Tag places',
                overflow: TextOverflow.ellipsis,
                style: textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SliverGap(8),
          SliverFillRemaining(
            child: PhotoPlacesWidget(
              onSelectedTags: (List<String> places) {
                setState(() => _taggedPlaces = places);
              },
            ),
          ),
          const SliverGap(24),
        ],
      ),
    );
  }
}
