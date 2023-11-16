import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_mapper/app/dashboard/bloc/photo_gallery_cubit.dart';
import 'package:photo_mapper/app/dashboard/screens/photo_gallery_screen.dart';
import 'package:photo_mapper/core/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  runApp(
    ModularApp(
      module: AppModule(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => Modular.get<PhotoGalleryCubit>())
        ],
        child: const PhotoMapper(),
      ),
    ),
  );
}

class PhotoMapper extends StatelessWidget {
  const PhotoMapper({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photo Mapper',
      theme: ThemeData.dark(),
      home: const PhotoGalleryScreen(),
    );
  }
}
