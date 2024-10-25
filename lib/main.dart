import 'package:codeutsava/Services/SharedPreferencesService.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  await Firebase.initializeApp();
  await SharedPreferencesService.initialPreferences();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Codeutsava',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: Scaffold(),
    );
  }
}
