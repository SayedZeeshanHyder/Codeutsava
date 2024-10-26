import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsScreen extends StatelessWidget {
  List<Map<String, dynamic>> news = [
    {
      "imageUrl":
          "https://img.etimg.com/thumb/msid-113714613,width-100,height-75,resizemode-4/news/india/consider-treating-the-north-east-as-a-collective-block-by-allocating-10-of-central-funds-to-the-eight-states-assam-cm-to-16th-finance-commission.jpg",
      "title": '''Consider treating the North-East as a collective block by allocating 10% of central funds to the eight states: Assam CM to 16th Finance Commission''',
      "message":'''Guwahati: Assam chief minister Himanta Biswa Sarma urged the 16th Finance Commission to increase Assam's inter-se share within the framework of horizontal devolution and to consider treating the North-East as a collective block by allocating 10% of central funds to the eight states.''',
    },
    {
      "title":'''Best Racold Water heaters: Affordable, efficient, and reliable choices for your home''',
      "imageUrl":
      "https://img.etimg.com/thumb/msid-112212342,width-300,height-225,imgsize-22068,resizemode-75/racold.jpg",
      "message":'''Choosing the right water heater for your home is essential for comfort and energy efficiency. Racold, a leading brand in water heating solutions, offers affordable, efficient, and reliable water heaters. These water heaters are designed with advanced technology to provide quick and consistent hot water while ensuring energy savings. With a variety of models to suit different household needs, Racold water heaters are known for their durability and user-friendly features. Whether you are looking f ..''',
    },
    {
      "imageUrl":"https://img.etimg.com/thumb/msid-110984188,width-100,height-75,resizemode-4/markets/stocks/news/traders-corner-oil-stock-promises-to-rise-5-as-it-breaks-out-of-horizontal-trendline.jpg",
      "title":"TRADERS’ CORNER: Oil stock promises to rise 5% as it breaks out of horizontal trendline",
      "message":'''This midcap government undertaking stock is looking at a fresh breakout from horizontal trendline resistance. This can lead to a multi-month breakout and can trigger a potential up-move in the stock by 5.20%. The current levels are attractive to enter with a strong risk-reward ratio.Buy Recommendation: Oil India LtdBuy Range Rs. 675-677Stop loss ''',
    }
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView(
      children: [
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text("Recent News",style: GoogleFonts.roboto(fontSize: 20,fontWeight: FontWeight.bold),),
        ),
        Container(
          height: size.height * 0.45,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: news.length,
              itemBuilder: (context, index) {
                final currentNews = news[index];
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  width: size.width * 0.8,
                  child: Card(
                    elevation: 5,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          height: size.height * 0.2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(image: NetworkImage(currentNews['imageUrl'],),fit: BoxFit.fill),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(currentNews['title'],maxLines: 3,overflow: TextOverflow.ellipsis,style: GoogleFonts.roboto(fontWeight: FontWeight.bold,fontSize: 18),),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(currentNews['message'],maxLines: 3,),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text("Maharashtra News",style: GoogleFonts.roboto(fontSize: 20,fontWeight: FontWeight.bold),),
        ),
        Container(
          height: size.height * 0.45,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: news.length,
              itemBuilder: (context, index) {
                final currentNews = news[news.length-index-1];
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  width: size.width * 0.8,
                  child: Card(
                    elevation: 5,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          height: size.height * 0.2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(image: NetworkImage(currentNews['imageUrl'],),fit: BoxFit.fill),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(currentNews['title'],maxLines: 3,overflow: TextOverflow.ellipsis,style: GoogleFonts.roboto(fontWeight: FontWeight.bold,fontSize: 18),),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(currentNews['message'],maxLines: 3,),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
