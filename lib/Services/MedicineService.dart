import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
class MedicineService{
  
  static Future<Uint8List> getMedicineImage(File imageFile)async{
    final request = http.MultipartRequest("POST",Uri.parse("https://339f-14-139-61-195.ngrok-free.app/predict"),);
    final image = await http.MultipartFile.fromPath('image', imageFile.path, contentType: MediaType('image', 'jpeg'),); // Adjust content type as needed
    request.files.add(image);
    final response = await request.send();
    print(response.statusCode);
    final responseString = await response.stream.toBytes();
    return responseString;
  }
  
}