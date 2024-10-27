import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeechService{

  static FlutterTts tts = FlutterTts();
  
  static speak(String speeech)async{
    await tts.setSpeechRate(0.3);
    await tts.setVolume(1);
    await tts.speak(speeech);
  }

}