import 'package:flutter/material.dart';
import 'package:game_levels_scrolling_map/game_levels_scrolling_map.dart';
import 'package:game_levels_scrolling_map/model/point_model.dart';

class RoadMapFlutterCrush extends StatefulWidget {
  @override
  State<RoadMapFlutterCrush> createState() => _RoadMapFlutterCrushState();
}

class _RoadMapFlutterCrushState extends State<RoadMapFlutterCrush> {
  List<PointModel> points = [];

  @override
  void initState() {
    super.initState();
    initializePoints();
  }

  void initializePoints() {
    for (int i = 1; i < 51; i++) {
      PointModel point = PointModel(
        (100 * i).toDouble(),
        InkWell(
          onTap: (){
            print("Clicked on $i");
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle
            ),
            width: 60,
            height: 60,
            child: Center(child: Text("$i",style: TextStyle(color: Colors.white),),),
          ),
        ),
      );
      if (i == 1) point.isCurrent = true;
      points.add(point);
    }
  }

  @override
  Widget build(BuildContext context) {
    initializePoints();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: GameLevelsScrollingMap.scrollable(
          imageWidth: size.width*1.5, // Adjust width to fit properly
          imageHeight: size.height * 2,
          imageUrl: "assets/images/map_vertical.png",
          direction: Axis.vertical,
          reverseScrolling: true,
          points: points,
          pointsPositionDeltaX: 300,
          pointsPositionDeltaY: 500,
          currentPointDeltaY: 100,
          x_values: [-10,-20,-30,-40,-50,-60,-70,-80,-90,-100,90,80,70,60,50,40,30,20,10,],
          y_values: [10,20,30,40,50,60,70,80,90,100,110,120,130,140,150,160,170,180,190,]
        ),
      ),
    );
  }
}
