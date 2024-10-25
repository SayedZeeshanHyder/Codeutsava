import 'package:get/get.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechToTextController extends GetxController{

  RxBool speechEnabled = false.obs;
  final stt.SpeechToText _speechToText = stt.SpeechToText();
  RxString recognizedWord = "".obs;

  initSpeech() async {
    speechEnabled.value = await _speechToText.initialize();
  }

  startListening() async {
    print("Started Listening");
    recognizedWord.value = "";
    await _speechToText.listen(onResult: onSpeechResult,pauseFor: Duration(seconds: 5),);
  }

  stopListening() async {
    print("Stopped Listening");
    await _speechToText.stop();
    speechEnabled.value = false;
    if(recognizedWord.value.toLowerCase().contains("hello")){
      print("Hello Bola tune");
    }
  }

  void onSpeechResult(SpeechRecognitionResult result) {
    print(result.recognizedWords);
    recognizedWord.value = result.recognizedWords;
  }

}