import 'dart:convert';

import 'package:codeutsava/ApiKeys.dart';
import 'package:http/http.dart' as http;

class SerpApiService{

  static Future<List<String>> fetchImages(String query) async {
    final url =
        'https://serpapi.com/search?engine=google&tbm=isch&q=$query&api_key=$serpApiKey';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      final List<String> imageUrls = [];

      for (var image in jsonResponse['images_results']) {
        imageUrls.add(image['original']);
      }

      return imageUrls;
    } else {
      throw Exception('Failed to load images');
    }
  }
}