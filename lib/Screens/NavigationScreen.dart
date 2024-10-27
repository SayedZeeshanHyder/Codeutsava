import 'package:codeutsava/Controller/LocationController.dart';
import 'package:codeutsava/Controller/bottomnavcontroller.dart';
import 'package:codeutsava/Screens/Games/GamesScreen.dart';
import 'package:codeutsava/Screens/Health/healthscreen.dart';
import 'package:codeutsava/Screens/Movie/moviescreen.dart';
import 'package:codeutsava/Screens/Navigation/NavigationControllerScreen.dart';
import 'package:codeutsava/Screens/Profile/profile.dart';
import 'package:codeutsava/Screens/VR/VRVideo.dart';
import 'package:codeutsava/Screens/VR/listofvideos.dart';
import 'package:codeutsava/Screens/Zego/VideoCallScreen.dart';
import 'package:codeutsava/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/SpeechToTextController.dart';
import 'Navigation/PathScreen.dart';

class NavigationScreen extends StatefulWidget {

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {

  final bottomNavController = Get.put(BottomNavController(),);
  final locationController = Get.put(LocationController(),);

  int currentIndex = 0;
  final SpeechToTextController speechToTextController = Get.put(SpeechToTextController(),);

  @override
  void initState() {
    super.initState();
    locationController.setUserLocation();
  }

  @override
  Widget build(BuildContext context) {
    final List<BottomNavigationBarItem> bottomNavItems = [
      BottomNavigationBarItem(icon: Icon(Icons.home),label: context.locale == Locale("en") ? "Home": "होम",backgroundColor: mainColor,),
      BottomNavigationBarItem(icon: Icon(Icons.gamepad),label: context.locale == Locale("en") ? "Games": "खेल",backgroundColor: mainColor),
      BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.transparent,),label: "",),
      BottomNavigationBarItem(icon: Icon(Icons.medical_information),label: context.locale == Locale("en") ? "Health": "स्वास्थ्य",backgroundColor: mainColor),
      BottomNavigationBarItem(icon: Icon(Icons.person),label: context.locale == Locale("en") ? "Profile": "प्रोफ़ाइल",backgroundColor: mainColor),
    ];
    final List<Widget> pages = [
      SizedBox(),
      //HeartRateScreen(),
      GamesScreen(),
      SizedBox(),
      HealthScreen(),
      ProfileScreen(),
    ];
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: InkWell(
        onLongPress: (){
          Get.to(()=>NavigationControllerScreen(),);
        },
        child: FloatingActionButton(onPressed: (){
          Get.to(()=>PathScreen(),);
        },backgroundColor: Colors.white,foregroundColor: mainColor,child: Icon(Icons.navigation,),),
      ),
      appBar:AppBar(
        title: Obx(()=> Text(bottomNavController.appBarTitle.value),),
        actions: [

          TextButton(onPressed: (){
            context.locale == Locale('en')
                ? context.setLocale(Locale('hi'))
                : context.setLocale(Locale('en'));
          },child: Text(context.locale == Locale("en") ? "aa" : "आ",style: TextStyle(color: Colors.white),),),

          IconButton(onPressed: (){
            Get.to(()=>VideoCall(),);
          },icon: Icon(Icons.video_call),),
          IconButton(onPressed: (){
            Get.to(()=>ListOfVideos(),);
          },icon: Icon(Icons.tv),),
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
        ],
      ),
      bottomNavigationBar: Obx(
        ()=> BottomNavigationBar(
          items: bottomNavItems,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.blue.shade200,
          currentIndex: bottomNavController.currentIndex.value,
          onTap: (index){
            if(index!=2){
              bottomNavController.changeIndex(index,context);
            }
          },
        ),
      ),
      body: Obx(()=> pages[bottomNavController.currentIndex.value]),
    );
  }
}
