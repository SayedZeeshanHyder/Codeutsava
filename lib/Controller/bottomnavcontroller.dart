import 'package:codeutsava/Screens/NavigationScreen.dart';
import 'package:codeutsava/main.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavController extends GetxController{

  RxInt currentIndex = 0.obs;
  RxString appBarTitle = "Home".obs;

  changeIndex(int index,BuildContext context){
    switch(index){
      case 0:appBarTitle.value=context.locale == Locale('en')
          ?"Home":"होम";break;
      case 1:appBarTitle.value=context.locale == Locale('en')
          ?"Games":"खेल";break;
      case 3:appBarTitle.value=context.locale == Locale('en')
          ?"Health":"स्वास्थ्य";break;
      case 4:appBarTitle.value=context.locale == Locale('en')
          ?"Profile":"प्रोफ़ाइल";break;
    }
    currentIndex.value = index;
  }

}