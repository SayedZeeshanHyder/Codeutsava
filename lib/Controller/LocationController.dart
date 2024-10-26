import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';

class LocationController extends GetxController{
  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;

  setUserLocation() async{
    LocationPermission gotPermission = await Geolocator.requestPermission();
    if(gotPermission == LocationPermission.whileInUse) {
      Position position = await Geolocator.getCurrentPosition();
      latitude.value = position.latitude;
      longitude.value = position.longitude;
    }
  }
}