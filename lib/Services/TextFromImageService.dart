
import 'dart:io';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class ImageToText{

  static final _textRecognizer = TextRecognizer();

  static Future<String> processImage(File imageFile) async {

    try {

      final recognizedText = await _textRecognizer
          .processImage(InputImage.fromFile(imageFile));
      await _textRecognizer.close();
      return recognizedText.text;

    } catch (e) {

      // Handle errors gracefully
      print('Error processing image: $e');

      return "";

    }
  }

  static Future<String> performTextRecognitionOperation(File imageFile,)async{

    //Recognizing Text from Image File
    String recognizedText = await processImage(imageFile);

    return recognizedText;
  }
}
