import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NavigationControllerScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              updateFirebase("Turn Right");
            }, child: Text("Turn Right"),),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: (){
              updateFirebase("Turn Left");
            }, child: Text("Turn Left"),),
          ],
        ),
      ),
    );
  }

  updateFirebase(String soundText)async{
    await FirebaseFirestore.instance.collection("sample").doc("sample").set({
      "soundText":soundText
    });
  }

}
