import 'package:codeutsava/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            CircleAvatar(
              radius: 85,
            ),
            SizedBox(
              height: 10,
            ),
            Text("Sunil Pal",style: GoogleFonts.roboto(fontWeight: FontWeight.bold,fontSize: 23,color: Colors.grey.shade800),),
            Text("sunil27Pal@gmail.com",style: GoogleFonts.roboto(fontWeight: FontWeight.bold,color: Colors.grey.shade400),),
            SizedBox(
              height: 25,
            ),
            _buildHealthSection(size),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Opacity(
                    opacity: 0.9,
                    child: Container(
                      alignment: Alignment.center,
                    height: size.height*0.2,
                    decoration: BoxDecoration(
                      color: Color(0xFF007FFF),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    width: size.width*0.4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.phone,color: Colors.white,size: 38,),
                          SizedBox(
                            height: 15,
                          ),
                          Text("Emergency\nContacts",style: GoogleFonts.roboto(color: Colors.white,fontWeight: FontWeight.bold),textAlign: TextAlign.center,)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    height: size.height*0.2,
                    decoration: BoxDecoration(
                        color: Color(0xFF007FFF),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    width: size.width*0.4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.menu_book_outlined,color: Colors.white,size: 38,),
                        SizedBox(
                          height: 15,
                        ),
                        Text("My Diary",style: GoogleFonts.roboto(color: Colors.white,fontWeight: FontWeight.bold),textAlign: TextAlign.center,)
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: size.width*0.9,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                titleTextStyle: GoogleFonts.roboto(color: Colors.white,fontWeight: FontWeight.bold),
                title: Text("Logout"),
                leading: Icon(Icons.logout,color: Colors.white,),
              ),
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHealthSection(Size size) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.blue.withOpacity(0.2), blurRadius: 10, offset: Offset(0, 5)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Health Overview',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildHealthMetric('Steps', '8,421', Icons.directions_walk, Colors.blue),
              _buildHealthMetric('Heart Rate', '72 bpm', Icons.favorite, Colors.red),
              _buildHealthMetric('Calories', '1,650 kcal', Icons.local_fire_department, Colors.orange),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHealthMetric(String label, String value, IconData icon, Color color) {
    return Column(
      children: [
        Icon(icon, size: 30, color: color),
        SizedBox(height: 8),
        Text(value, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
        SizedBox(height: 4),
        Text(label, style: TextStyle(color: Colors.grey)),
      ],
    );
  }

}
