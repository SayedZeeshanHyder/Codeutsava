import 'package:flutter/material.dart';

class GamesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(itemCount: 4,itemBuilder: (context,index){
      return Container(
        height: size.height*0.1,
        width: size.width*0.9,
        color: Colors.red,
      );
    });
  }
}
