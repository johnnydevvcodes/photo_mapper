import 'dart:developer';

import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class PhotoService {
  Future<XFile?> takePhoto() async {
    //ask permission
    var camera = await Permission.camera.status;
    if (camera.isPermanentlyDenied) {
      await openAppSettings();
      var camera = await Permission.camera.status;
      if (!camera.isGranted) return null;
    } else {
      var status = await Permission.camera.request();
      if (!status.isGranted) return null;
    }

    //granted access
    final ImagePicker picker = ImagePicker();
    // Pick an image
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    log("image from camera: ${image?.path}");
    return image;
  }

  Future<List<XFile>> openPhotos() async {
    //ask permission
    var status = await Permission.photos.status;
    if (status.isPermanentlyDenied) {
      await openAppSettings();
      var status = await Permission.photos.status;
      if (!status.isGranted) return [];
    } else {
      var status = await Permission.photos.request();
      if (!status.isGranted) return [];
    }

    //granted access
    final ImagePicker picker = ImagePicker();
    // Pick an image
    final List<XFile> images = await picker.pickMultiImage();
    log("images: $images");
    return images;
  }
}
