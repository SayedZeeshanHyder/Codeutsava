import 'dart:math';

import 'package:codeutsava/Controller/LocationController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class PathScreen extends StatefulWidget {

  @override
  State<PathScreen> createState() => _PathScreenState();
}

class _PathScreenState extends State<PathScreen> {

  @override
  void initState() {
    super.initState();
    print("Inside");
  }

  final locationController = Get.put(LocationController(),);

  @override
  Widget build(BuildContext context) {
    double bearing = calculateBearing(locationController.latitude.value, locationController.longitude.value, 10.0, 10.0);
    double rotationY = -bearing * (pi / 180);

    return Scaffold(
      body: ModelViewer(
        src: 'assets/threed/scene.gltf',
        cameraOrbit: '${rotationY.toStringAsFixed(2)}deg 0deg 1.0m',
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
}
