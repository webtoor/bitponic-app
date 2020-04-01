import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GridDashboard extends StatelessWidget {
  Items item1 = new Items(
    title: "40",
    subtitle: "Suhu",
    event: "",
    img: "assets/logo.png",
  );

  Items item2 = new Items(
    title: "23",
    subtitle: "Suhu Air",
    event: "",
    img: "assets/logo.png",
  );
  Items item3 = new Items(
    title: "80",
    subtitle: "Kelembaban",
    event: "",
    img: "assets/logo.png",
  );
  Items item4 = new Items(
    title: "7",
    subtitle: "PH",
    event: "",
    img: "assets/logo.png",
  );
  Items item5 = new Items(
    title: "1000",
    subtitle: "EC",
    event: "",
    img: "assets/logo.png",
  );
  Items item6 = new Items(
    title: "277",
    subtitle: "TDS",
    event: "",
    img: "assets/logo.png",
  );

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4, item5, item6];
    //var color = 0xff453658;

    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 16, right: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: myList.map((data) {
            return Card(
              elevation: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    data.img,
                    width: 42,
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    data.title + ' °C',
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    data.subtitle,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.blue,
                            fontSize: 10,
                            fontWeight: FontWeight.w600)),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    data.event,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.blue,
                            fontSize: 11,
                            fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
            );
          }).toList()),
    );
  }
}

class Items {
  String title;
  String subtitle;
  String event;
  String img;
  Items({this.title, this.subtitle, this.event, this.img});
}
