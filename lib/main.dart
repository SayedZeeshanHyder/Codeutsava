import 'package:codeutsava/Screens/Auth/GoogleAuthScreen.dart';
import 'package:codeutsava/Screens/NavigationScreen.dart';
import 'package:codeutsava/Services/SharedPreferencesService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SharedPreferencesService.initialPreferences();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Codeutsava',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: auth.currentUser !=null ? NavigationScreen() : GoogleAuthScreen(),
    );
  }
}
