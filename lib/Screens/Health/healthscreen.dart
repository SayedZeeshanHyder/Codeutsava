import 'dart:io';

import 'package:codeutsava/Services/ImageService.dart';
import 'package:codeutsava/Services/TextFromImageService.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HealthScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(onPressed: ()async{
        File imageFile = await ImageService.getImageFromGallery(ImageSource.camera);
        String recognizedText = await ImageToText.processImage(imageFile);
        print(recognizedText);
        print("Ho Gya");
      }, child: Text("Get Image"),),
    );
  }
}
