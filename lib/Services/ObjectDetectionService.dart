/*
import 'dart:io';

import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';

class ObjectDetectionService{

  static final ObjectDetector objectDetector = ObjectDetector(options: ObjectDetectorOptions(mode: DetectionMode.single, classifyObjects: true, multipleObjects: true),);

  static detectObject(File imageFile)async{
    print("Detection Started");
    InputImage inputImage = InputImage.fromFile(imageFile);
    List<DetectedObject> objects = await objectDetector.processImage(inputImage);
    print(objects.length);
    for(int i=0;i<objects.length;i++){
      DetectedObject object = objects[i];
      print(object.labels);
    }
  }

}*/
