import 'package:codeutsava/Screens/Games/GamesScreen.dart';
import 'package:codeutsava/Screens/HeartRate/HeartRateScreen.dart';
import 'package:codeutsava/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/SpeechToTextController.dart';

class NavigationScreen extends StatefulWidget {

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final List<BottomNavigationBarItem> bottomNavItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home),label: "Item1",backgroundColor: mainColor,),
    BottomNavigationBarItem(icon: Icon(Icons.home),label: "Item2",backgroundColor: mainColor),
    BottomNavigationBarItem(icon: Icon(Icons.home),label: "Item3",backgroundColor: mainColor),
    BottomNavigationBarItem(icon: Icon(Icons.home),label: "Item4",backgroundColor: mainColor),
  ];

  final List<Widget> pages = [
    HeartRateScreen(),
    GamesScreen(),
    SizedBox(),
    SizedBox(),
  ];
  int currentIndex = 0;
  final SpeechToTextController speechToTextController = Get.put(SpeechToTextController(),);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        actions: [
          Obx(()=> Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),),
            ),
            child: IconButton(onPressed: ()async{
              bool isSpeechToTextEnabled = speechToTextController.speechEnabled.value;
              if(!isSpeechToTextEnabled){
                await speechToTextController.initSpeech();
                await speechToTextController.startListening();
              }else{
                await speechToTextController.stopListening();
              }
            }, icon: Icon(speechToTextController.speechEnabled.value ? Icons.stop:Icons.mic,),),
          ),),
          IconButton(onPressed: (){

          },icon: Icon(Icons.tv),),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavItems,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.purple.shade300,
        currentIndex: currentIndex,
        onTap: (index){
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: pages[currentIndex],
    );
  }
}
