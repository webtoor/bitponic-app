import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          margin: EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              buildCard(Icons.account_box, "Hidroponics"),
              buildCard(Icons.account_box, "Hidroponics"),
              buildCard(Icons.account_box, "Hidroponics"),
              buildCard(Icons.account_box, "Hidroponics"),


            ],
          ),
        ));
  }
}

Card buildCard(IconData iconData, String text) {
  return Card(
    elevation: 10,
    child: Row(
      children: <Widget>[
        Container(margin: EdgeInsets.all(20), child: Icon(iconData)),
        Text(
          text,
          style: GoogleFonts.openSans(
              textStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
        ),
      ],
    ),
  );
}
