import 'package:codeutsava/Screens/VR/VRVideo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ListOfVideos extends StatelessWidget {

  List<Map<String,dynamic>> videosList = [
    {
      "tumbnail":"https://i.ytimg.com/vi/6n9ESFJTnHs/hqdefault.jpg",
      "title":"Charlie Chaplin - Factory Scene - Modern Times (1936)",
      "description":"Charlie Chaplin"
    },
    {
      "tumbnail":"https://i.ytimg.com/vi/_0a998z_G4g/hqdefault.jpg",
      "title":"Charlie Chaplin - The Lion Cage - Full Scene (The Circus, 1928)",
      "description":"Charlie Chaplin"
    },
    {
      "tumbnail":"https://i.ytimg.com/vi/4Jg1NS3zlT4/hqdefault.jpg",
      "title":"Charlie Chaplin - The Lion Cage - Full Scene (The Circus, 1928)",
      "description":"Charlie Chaplin"
    },
    {
      "tumbnail":"https://i.ytimg.com/vi/n4mD7QzDodc/hqdefault.jpg",
      "title":"Shaktimaan title Song/shaktimaan title track #shaktiman#शक्तिमान #shaktimanhindi #shaktimanstatus",
      "description":"Shaktimaan Fans Club",
    },
    {
      "tumbnail":"https://i.ytimg.com/vi/n4mD7QzDodc/hqdefault.jpg",
      "title":"Shaktimaan title Song/shaktimaan title track #shaktiman#शक्तिमान #shaktimanhindi #shaktimanstatus",
      "description":"Shaktimaan Fans Club",
    },
    {
      "tumbnail":"https://i.ytimg.com/vi/n4mD7QzDodc/hqdefault.jpg",
      "title":"Shaktimaan title Song/shaktimaan title track #shaktiman#शक्तिमान #shaktimanhindi #shaktimanstatus",
      "description":"Shaktimaan Fans Club",
    },
    {
      "tumbnail":"https://i.ytimg.com/vi/n4mD7QzDodc/hqdefault.jpg",
      "title":"Shaktimaan title Song/shaktimaan title track #shaktiman#शक्तिमान #shaktimanhindi #shaktimanstatus",
      "description":"Shaktimaan Fans Club",
    },
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("VR Videos"),
      ),
      body: ListView.builder(itemCount: videosList.length,itemBuilder: (context,index){
        final video = videosList[index];
        return InkWell(
          onTap: (){
            Get.to(()=>VideoPlayerScreen(videoUrl: 'assets/videos/vid$index.mp4'));
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                width: size.width*0.3,
                height: size.height*0.11,
                child: Image.network(video['tumbnail'],fit: BoxFit.fill,),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(video['title'],style: GoogleFonts.roboto(fontWeight: FontWeight.bold),),
                    Text(video['description']),
                  ],
                ),
              ),
            ],
          ),
        );
        },)
    );
  }
}
