import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService
{

  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final GoogleSignIn _googleSignIn = GoogleSignIn();

  static Future<Map<String,dynamic>> signInUsingGoogle()async{

    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return {
          "boolVal":false,
          "status":"GoogleSignIn Failed",
          "message":"Unexpected Error Occured"
        };
      }

      final GoogleSignInAuthentication googleAuth = await googleUser
          .authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _auth.signInWithCredential(credential);
      return {
        "boolVal":true,
        "status":"Signed In Successful",
        "message":"Welcome"
      };
    }
    catch(e){
      print(e.toString());
      return {
        "boolVal":false,
        "status":"Error Occured",
        "message":e.toString()
      };
    }
  }

}