import 'package:codeutsava/ApiKeys.dart';
import 'package:codeutsava/Screens/Auth/GoogleAuthScreen.dart';
import 'package:codeutsava/Screens/NavigationScreen.dart';
import 'package:codeutsava/Services/SharedPreferencesService.dart';
import 'package:codeutsava/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Gemini.init(apiKey: geminiApiKey);
  await SharedPreferencesService.initialPreferences();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('hi')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    print("HELLO");
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Codeutsava',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            backgroundColor: mainColor,
            foregroundColor: Colors.white,
            titleTextStyle:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 23)),
        useMaterial3: true,
      ),
      home: auth.currentUser != null ? NavigationScreen() : GoogleAuthScreen(),
    );
  }
}
