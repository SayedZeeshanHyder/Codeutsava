import 'dart:async';
import 'dart:math';

import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codeutsava/Controller/LocationController.dart';
import 'package:codeutsava/Services/SharedPreferencesService.dart';
import 'package:codeutsava/Services/texttospeechservice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class PathScreen extends StatefulWidget {

  @override
  State<PathScreen> createState() => _PathScreenState();
}

class _PathScreenState extends State<PathScreen> {

  bool shouldSetState = true;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  CameraController? _controller;
  List<CameraDescription>? cameras;

  Future<void> _initializeCamera() async {
    cameras = await availableCameras();
    _controller = CameraController(
      cameras![0],
      ResolutionPreset.high,
    );
    await _controller!.initialize();
    setState(() {});
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  final locationController = Get.put(LocationController(),);

  @override
  Widget build(BuildContext context) {
    double bearing = calculateBearing(locationController.latitude.value, locationController.longitude.value, 10.0, 10.0);
    double rotationY = -bearing * (pi / 180);

    if (_controller == null || !_controller!.value.isInitialized) {
      return const Scaffold(body: Center(child: CircularProgressIndicator(),),);
    }

    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("sample").doc("sample").snapshots(),
          builder: (context, snapshot){

            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            final data = snapshot.data!.data();
            print(data);
            String soundText = data!['sound'];
            playSoundIfPossible(soundText);

            return Stack(
              children: [
                Container(width: size.width,height: size.height,child: CameraPreview(_controller!)),

                Positioned(
                  bottom: 0,
                  child: Container(
                    height: 150,
                    width: size.width,
                    child: ModelViewer(
                      alt: 'A 3D model of an astronaut',
                      src: 'assets/threed/direction_arrow.glb',
                      cameraOrbit: '${rotationY.toStringAsFixed(2)}deg 0deg 1.0m',
                    ),
                  ),
                ),

                Positioned(
                  left: 0,
                  child: InkWell(onTap: ()async{
                    await TextToSpeechService.speak("Turn Left");
                  },child: Text("Speak",style: TextStyle(color: Colors.transparent),),),
                ),

                Positioned(
                  right: 0,
                  child: InkWell(onTap: ()async{
                    await TextToSpeechService.speak("Turn Right");
                  },child: Text("Speak",style: TextStyle(color: Colors.transparent),),),
                ),
              ],
            );
          }
        ),
      ),
    );
  }

  double calculateBearing(double lat1, double lon1, double lat2, double lon2) {
    double dLon = lon2 - lon1;
    double y = sin(dLon) * cos(lat2);
    double x = cos(lat1) * sin(lat2) - sin(lat1) * cos(lat2) * cos(dLon);
    double brng = atan2(y, x);
    brng = brng * (180 / pi);
    brng = (brng + 360) % 360;
    return brng;
  }

  playSoundIfPossible(String soundText)async{
    if(SharedPreferencesService.getSoundText() == soundText){

    }else {
      await TextToSpeechService.speak(soundText);
      await SharedPreferencesService.setSoundText(soundText);
    }


  }
}
