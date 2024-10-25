import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService{

  static late SharedPreferences prefs;

  static initialPreferences()async{
    prefs = await SharedPreferences.getInstance();
  }

}