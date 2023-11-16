import 'package:flutter/material.dart';
import 'package:photo_mapper/core/core.dart';
import 'package:gap/gap.dart';

class PhotoDetailScreen extends StatefulWidget {
  final PhotoEntity user;
  const PhotoDetailScreen(this.user, {Key? key}) : super(key: key);

  @override
  State<PhotoDetailScreen> createState() => _PhotoDetailScreenState();
}

class _PhotoDetailScreenState extends State<PhotoDetailScreen> {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(children: [
            IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ))
          ])),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    SizedBox(
                        width: 92,
                        child: Image.network(
                          fit: BoxFit.cover,
                          widget.user.imageUrl,
                        )),
                    const Gap(18),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.user.id, style: textTheme.titleLarge),
                        const Gap(8),
                        Text(widget.user.name,
                            style: textTheme.titleLarge!
                                .copyWith(fontWeight: FontWeight.bold)),
                        const Gap(8),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
