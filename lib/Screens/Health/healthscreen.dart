import 'dart:io';
import 'dart:typed_data';

import 'package:codeutsava/Screens/Health/ViewMedicineScreen.dart';
import 'package:codeutsava/Screens/Health/calendar.dart';
import 'package:codeutsava/Services/MedicineService.dart';
import 'package:codeutsava/Services/SerpApiService.dart';
import 'package:codeutsava/Services/geminiservice.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class HealthScreen extends StatefulWidget {
  @override
  State<HealthScreen> createState() => _HealthScreenState();
}

class _HealthScreenState extends State<HealthScreen> {
  Uint8List? responseBytes;

  @override
  void initState() {
    super.initState();
  }

  hitSerpApi() async {
    List<String> images = await SerpApiService.fetchImages("Green Vegetables");
    print(images);
  }

  hitGeminiApi() async {
    List<Map<String, dynamic>>? promptResponse = await GeminiService.textPompt(
        "Please provide a list of low-calorie food recommendations for older adults. Each item in the list should include the following details in JSON format: name of the food, calorie count per serving, key nutrients, and a brief description. Aim for a variety of foods that are easy to prepare and digest.Hello How are you?");
    //print(promptResponse!.length);
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> foods = [
      {
        "name": "Radish",
        "imgUrl":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgzCeawsKEFy5j4inYz1lnzpz6pg_odI0s7A&s",
        "message":
            "Radishes are a good source of potassium, folate, and vitamin C, with one cup of radish slices (116 g) clocking up just 18 calories",
      },
      {
        "name":"Tomatoes",
        "imgUrl":"https://media.post.rvohealth.io/wp-content/uploads/2020/09/AN313-Tomatoes-732x549-Thumb.jpg",
        "message":"Tomatoes are an excellent source of the antioxidant lycopene, as well as being high in vitamin C, potassium, folate, and vitamin K.A 126-g serving contains 25 calories"
      }
    ];
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Column(
      children: [
        SizedBox(
          height: 15,
        ),
        InkWell(
          onTap: () async {
            XFile? pickedFile = await ImagePicker.platform
                .getImageFromSource(source: ImageSource.gallery);
            File imageFile = File(pickedFile!.path);
            responseBytes = await MedicineService.getMedicineImage(imageFile);
            Get.to(() => ViewMedicineScreen(imageData: responseBytes),
                transition: Transition.rightToLeft);
          },
          child: Row(
            children: [
              SizedBox(
                width: 20,
              ),
              IconButton(
                onPressed: () {
                  Get.to(() => CalendarPage(),
                      transition: Transition.leftToRight);
                },
                icon: Icon(
                  Icons.calendar_month,
                ),
              ),
              Spacer(),
              Container(
                width: size.width * 0.1,
                child: Image.asset("assets/images/medicineIcon.png"),
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        _buildGraphSection(size),
        SizedBox(
          height: 15,
        ),
        _buildSectionCard(context, Icons.medical_services, 'Medical',
            'Track your medical records', Colors.blue, size),
        SizedBox(
          height: 15,
        ),
        Container(
          width: size.width * 0.9,
          child: Text(
            "Suggested Foods (Calorie)",
            style:
                GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 17.5),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5),
          height: size.height * 0.175,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: foods.length,
              itemBuilder: (context, index) {
                final food = foods[index];
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  width: size.width * 0.75,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                            offset: Offset(0, 5)),
                      ],
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Container(
                        width: size.width * 0.2,
                        child: Image.network(food['imgUrl'],fit: BoxFit.fill,),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              food['name'],
                              maxLines: 2,
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Text(
                              food['message'],
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    ));
  }

  Widget _buildGraphSection(Size size) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 10,
              offset: Offset(0, 5)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Weekly Steps',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          SizedBox(height: 10),
          Container(
            height: 200,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      getTitlesWidget: (value, meta) {
                        switch (value.toInt()) {
                          case 0:
                            return Text("Mon");
                          case 1:
                            return Text("Tue");
                          case 2:
                            return Text("Wed");
                          case 3:
                            return Text("Thu");
                          case 4:
                            return Text("Fri");
                          case 5:
                            return Text("Sat");
                          case 6:
                            return Text("Sun");
                          default:
                            return Text("");
                        }
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      getTitlesWidget: (value, meta) {
                        return Text(value.toInt().toString());
                      },
                    ),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(color: Colors.black, width: 1),
                ),
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      FlSpot(0, 8500),
                      FlSpot(1, 9200),
                      FlSpot(2, 7000),
                      FlSpot(3, 8000),
                      FlSpot(4, 6500),
                      FlSpot(5, 9000),
                      FlSpot(6, 7500),
                    ],
                    isCurved: true,
                    color: Colors.blue,
                    dotData: FlDotData(show: true),
                    belowBarData: BarAreaData(show: false),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionCard(BuildContext context, IconData icon, String title,
      String description, Color color, Size size) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('$title section tapped!')));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                color: color.withOpacity(0.2),
                blurRadius: 10,
                offset: Offset(0, 5)),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: color.withOpacity(0.1),
              child: Icon(icon, color: color, size: 30),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(height: 4),
                  Text(description, style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 18),
          ],
        ),
      ),
    );
  }
}
