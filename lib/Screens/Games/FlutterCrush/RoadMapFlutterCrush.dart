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
        100,
        Container(
          width: 40,
          height: 40,
          color: Colors.red,
          child: Text("$i"),
        ),
      );
      if (i == 1) point.isCurrent = true;
      points.add(point);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: GameLevelsScrollingMap.scrollable(
          imageUrl: "assets/drawable/map_vertical.png",
          direction: Axis.vertical,
          reverseScrolling: true,
          svgUrl: 'assets/svg/map_vertical.svg',
          points: points,
        ),
      ),
    );
  }
}
