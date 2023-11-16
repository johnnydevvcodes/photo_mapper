import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:photo_mapper/app/photo_details/screens/photo_details_screen.dart';
import 'package:photo_mapper/core/core.dart';

class PhotoItemWidget extends StatefulWidget {
  const PhotoItemWidget(this.photo, {super.key});
  final PhotoEntity photo;

  @override
  State<PhotoItemWidget> createState() => _PhotoItemWidgetState();
}

class _PhotoItemWidgetState extends State<PhotoItemWidget> {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return CupertinoButton(
      padding: EdgeInsets.zero,
      minSize: 0,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PhotoDetailScreen(widget.photo),
          ),
        );
      },
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
              const Gap(8),
              if (widget.photo.places.isNotEmpty)
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined),
                    Expanded(
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.start,
                        children:
                            widget.photo.places.map((e) => Text('$e,')).toList(),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
