import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_mapper/app/photo_details/bloc/photo_places_cubit.dart';
import 'package:photo_mapper/app/photo_details/bloc/photo_places_state.dart';

class PhotoPlacesWidget extends StatefulWidget {
  final ValueChanged<List<String>> onSelectedTags;
  const PhotoPlacesWidget({super.key, required this.onSelectedTags});

  @override
  State<PhotoPlacesWidget> createState() => _PhotoPlacesWidgetState();
}

class _PhotoPlacesWidgetState extends State<PhotoPlacesWidget> {
  final _taggedPlaces = <String>[];
  @override
  void initState() {
    super.initState();
    context.read<PhotoPlacesCubit>().initialize();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhotoPlacesCubit, PhotoPlacesState>(
      builder: (context, PhotoPlacesState state) {
        switch (state) {
          case PlacesLoaded():
            return GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 2,
              padding: const EdgeInsets.all(8),
              crossAxisSpacing: 2,
              crossAxisCount: 2,
              children: state.photos
                  .map(
                    (place) => GestureDetector(
                      onTap: () {
                        bool isTagged = _taggedPlaces.contains(place.name);
                        isTagged
                            ? _taggedPlaces.remove(place.name)
                            : _taggedPlaces.add(place.name);
                        widget.onSelectedTags(_taggedPlaces);
                        setState(() {});
                      },
                      child: Card(
                        child: SizedBox(
                          height: 100,
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.network(place.imageUrl, fit: BoxFit.cover),
                              Positioned(
                                bottom: 4,
                                left: 4,
                                child: Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: const BoxDecoration(
                                        color: Colors.black38),
                                    child: Text(place.name)),
                              ),
                              if (_taggedPlaces.contains(place.name))
                                Container(color: Colors.yellow.withOpacity(.5))
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            );
          case ErrorState():
            return Center(child: Text(state.error));
          default:
            return const Center(child: CircularProgressIndicator.adaptive());
        }
      },
    );
  }
}
