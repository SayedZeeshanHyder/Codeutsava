import 'package:codeutsava/Controller/bottomnavcontroller.dart';
import 'package:codeutsava/Screens/Navigation/PathScreen.dart';
import 'package:get/get.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechToTextController extends GetxController{

  RxBool speechEnabled = false.obs;
  final stt.SpeechToText _speechToText = stt.SpeechToText();
  RxString recognizedWord = "".obs;
  final bottomNavController = Get.put(BottomNavController(),);

  initSpeech() async {
    speechEnabled.value = await _speechToText.initialize();
  }

  startListening() async {
    print("Started Listening");
    recognizedWord.value = "";
    await _speechToText.listen(onResult: onSpeechResult,);
  }

  stopListening() async {
    print("Stopped Listening");
    await _speechToText.stop();
    speechEnabled.value = false;
    if(recognizedWord.value.toLowerCase().contains("game")){
      bottomNavController.currentIndex.value=1;
    }else if(recognizedWord.value.toLowerCase().contains("navigation")){
      Get.to(()=>PathScreen(),);
    }else if(recognizedWord.value.toLowerCase().contains("health") || recognizedWord.value.toLowerCase().contains("med")){
      bottomNavController.currentIndex.value=3;
    }else if(recognizedWord.value.toLowerCase().contains("pro")){
      bottomNavController.currentIndex.value = 4;
    }else if(recognizedWord.value.toLowerCase().contains("home")){
      bottomNavController.currentIndex.value = 0;
    }
  }

  void onSpeechResult(SpeechRecognitionResult result) {
    print(result.recognizedWords);
    recognizedWord.value = result.recognizedWords;
  }

}