/*
import 'dart:io';

import 'package:learning_input_image/src/input_image.dart';
import 'package:learning_object_detection/learning_object_detection.dart';

class LearnObjectDetection{

  static processImage(File imageFile)async{
    InputImage image = InputImage.fromFile(imageFile);
    ObjectDetector detector = ObjectDetector();
    List<DetectedObject> result = await detector.detect(image);
    for(int j=0;j<result.length;j++){
      final object = result[j];
      print(object.labels);
    }
  }

}*/
