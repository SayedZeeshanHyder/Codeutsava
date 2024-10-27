import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewFoodScreen extends StatelessWidget {
  ViewFoodScreen({required this.listOfFoodNutrition, required this.imageFile});

  File imageFile;
  List<dynamic> listOfFoodNutrition;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(),
      body: Stack(
        children: [
          Center(
            child: Image.file(imageFile),
          ),
          Positioned(
            top: size.height * 0.3,
            child: Container(
              height: size.height * 0.5,
              width: size.width,
              child: GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  itemCount: listOfFoodNutrition.length,
                  itemBuilder: (context, index) {
                    Map<String, dynamic> map =
                        listOfFoodNutrition[index] as Map<String, dynamic>;
                    print(map);
                    return SingleChildScrollView(
                      child: Opacity(
                        opacity: 0.8,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${map['food_name'].toString().substring(0,1).toUpperCase()}${map['food_name'].toString().substring(1)}",
                                style:
                                    GoogleFonts.roboto(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Calories = ${map['nutrition']['calories'].toString()}",
                                style:
                                GoogleFonts.roboto(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Fats = ${map['nutrition']['total_fats'].toString()}",
                                style:
                                GoogleFonts.roboto(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Proteins = ${map['nutrition']['proteins'].toString()}",
                                style:
                                GoogleFonts.roboto(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),),
            ),
          ),
        ],
      ),
    );
  }
}
