import 'package:codeutsava/Controller/SpeechToTextController.dart';
import 'package:codeutsava/Screens/SpeechText/SpeechToTextScreen.dart';
import 'package:codeutsava/Services/SharedPreferencesService.dart';
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

  final SpeechToTextController speechToTextController = Get.put(SpeechToTextController(),);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Codeutsava',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar:AppBar(
          actions: [
            Obx(()=> Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),),
              ),
              child: IconButton(onPressed: ()async{
                bool isSpeechToTextEnabled = speechToTextController.speechEnabled.value;
                if(!isSpeechToTextEnabled){
                  await speechToTextController.initSpeech();
                  await speechToTextController.startListening();
                }else{
                  await speechToTextController.stopListening();
                }
              }, icon: Icon(speechToTextController.speechEnabled.value ? Icons.stop:Icons.mic,),),
            ),),
          ],
        ),
      ),
    );
  }
}
