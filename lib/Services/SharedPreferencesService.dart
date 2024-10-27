import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService{

  static late SharedPreferences prefs;

  static initialPreferences()async{
    prefs = await SharedPreferences.getInstance();
  }

  static String getSoundText(){
    return prefs.getString("soundText") ?? "Turn Left";
  }

  static setSoundText(String soundText)async{
    await prefs.setString("soundText",soundText);
  }

}