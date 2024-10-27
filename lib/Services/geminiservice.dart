import 'dart:convert';

import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:get/get.dart';

class GeminiService{
  static final gemini = Gemini.instance;

  static Future<List<Map<String, dynamic>>?> textPompt(String prompt) async{
    try {
      final Candidates? response = await gemini.text(prompt);
      String? promptResponse = response!.content!.parts!.first.text;
      print("Prompt Response Before Cleaning $promptResponse");
      print("Prompt Response After Cleaning $promptResponse");
      List<dynamic> jsonList = jsonDecode(promptResponse!);
      List<Map<String, dynamic>> foodList = List<Map<String, dynamic>>.from(jsonList);
      return foodList;
    }catch(e){
      Get.snackbar("Unexpected Error Occured", e.toString());
    }
  }
}