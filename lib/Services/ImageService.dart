import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImageService{

  static Future<File> getImageFromGallery(ImageSource imageSource)async{
    final XFile? pickedImage = await ImagePicker.platform.getImageFromSource(source: imageSource);
    print(pickedImage!.path);
    File imageFile = File(pickedImage!.path);
    return imageFile;
  }

}