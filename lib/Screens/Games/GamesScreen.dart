import 'package:codeutsava/Screens/Games/FlutterCrush/RoadMapFlutterCrush.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GamesScreen extends StatelessWidget {

  List<Map<String,dynamic>> games = [
    {
      "name":"candyCrush",
      "assetUrl":"assets/images/candycrushimg.jpeg",
      "navigateTo":RoadMapFlutterCrush(),
    },
    {
      "name":"candyCrush",
      "assetUrl":"assets/images/crossword.png",
      "navigateTo":RoadMapFlutterCrush(),
    },{
      "name":"candyCrush",
      "assetUrl":"assets/images/sudoku.jpeg",
      "navigateTo":RoadMapFlutterCrush(),
    },{
      "name":"candyCrush",
      "assetUrl":"assets/images/candycrushimg.jpeg",
      "navigateTo":RoadMapFlutterCrush(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(itemCount: 4,itemBuilder: (context,index){
      final game = games[index];
      return InkWell(
        onTap: (){
          Widget navigateTo = game['navigateTo'];
          Get.to(()=>navigateTo,transition: Transition.leftToRight);
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
          height: size.height*0.25,
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(game['assetUrl']),fit: BoxFit.fill,),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
