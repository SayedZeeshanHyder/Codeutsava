import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:get/get.dart';

class GeminiService{
  static final gemini = Gemini.instance;

  static Future<List<Map<String, dynamic>>?> textPompt(String prompt) async{
    try {
      final Candidates? response = await gemini.text(prompt);
      String? promptResponse = response!.content!.parts!.first.text;
      List<dynamic> jsonList = jsonDecode(promptResponse!);
      List<Map<String, dynamic>> foodList = List<Map<String, dynamic>>.from(jsonList);
      return foodList;
    }catch(e){
      Get.snackbar("Unexpected Error Occured", e.toString());
    }
  }

  static Future<String?> geminiTextPrompt(String prompt) async{
    final Candidates? response = await gemini.text(prompt);
    String? promptResponse = response!.content!.parts!.first.text;
    print(promptResponse);
    return promptResponse;
  }

  static Future<String?> geminiImagePropmpt(String textPrompt,List<Uint8List> listOfImages) async{
    final Candidates? response = await gemini.textAndImage(text: textPrompt, images: listOfImages);
    String? promptResponse = response!.content!.parts!.first.text;
    print(promptResponse);
    return promptResponse;
  }
}