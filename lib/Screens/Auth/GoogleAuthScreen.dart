import 'package:auth_buttons/auth_buttons.dart';
import 'package:codeutsava/Screens/NavigationScreen.dart';
import 'package:codeutsava/Services/AuthService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class GoogleAuthScreen extends StatelessWidget {
  const GoogleAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GoogleAuthButton(onPressed: ()async{
          Map<String,dynamic> googleResponseMap = await AuthService.signInUsingGoogle();
          print(googleResponseMap);
          bool isGoogleAuthenticated = googleResponseMap['boolVal'];
          if(isGoogleAuthenticated){
            Get.off(()=> NavigationScreen(),);
          }
          //Get.snackbar(googleResponseMap['status'], googleResponseMap['message']);
        },style: AuthButtonStyle(
          buttonColor: Colors.black,
          textStyle: GoogleFonts.roboto(color: Colors.white)
        ),),
      ),
    );
  }
}
