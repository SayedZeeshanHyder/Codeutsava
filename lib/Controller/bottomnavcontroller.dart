import 'package:get/get.dart';

class BottomNavController extends GetxController{

  RxInt currentIndex = 0.obs;
  RxString appBarTitle = "Home".obs;

  changeIndex(int index){
    switch(index){
      case 0:appBarTitle.value="Home";break;
      case 1:appBarTitle.value="Games";break;
      case 3:appBarTitle.value="Health";break;
      case 4:appBarTitle.value="Profile";break;
    }
    currentIndex.value = index;
  }

}