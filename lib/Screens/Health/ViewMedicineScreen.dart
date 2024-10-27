import 'dart:typed_data';

import 'package:flutter/material.dart';

class ViewMedicineScreen extends StatelessWidget {

  final Uint8List imageData;
  ViewMedicineScreen({required this.imageData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.black,
      body: Center(child: Image.memory(imageData)),
    );
  }
}
