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
      child: SizedBox(
        height: 90,
        child: Card(
          elevation: 4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Gap(8),
              Text(widget.photo.id),
              const Gap(8),
              SizedBox(
                width: 68,
                child: Image.network(widget.photo.imageUrl),
              ),
              const Gap(8),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.photo.name, style: textTheme.bodyLarge),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
