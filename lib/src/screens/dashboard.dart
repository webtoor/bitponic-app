import 'package:bitponic/src/blocs/dashboard_bloc.dart';
import 'package:bitponic/src/models/user_project.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'griddashboard.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

/* final bloc = DashboardBloc(); */

class Dashboard extends StatefulWidget {
  @override
  DashboardState createState() => new DashboardState();
}

Future<UserProject> getUserProject() async {
  final response =
      await http.get("http://192.168.1.4:8000/api/v1/user-project", headers: {
    "content-type": "application/json",
    "accept": "application/json",
    "Authorization":
        "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMWYyMGJiZWVmNGNkNTkxMTEzZmU4NTBjODUyNzA2ODZlMWU1ZjA3YTRmZmFlNjNjYTE1NGMzOWNjOTI0NTNhYzU0MzEzMTc2ZWJmMTFlMDYiLCJpYXQiOjE1ODU4MzMxNzgsIm5iZiI6MTU4NTgzMzE3OCwiZXhwIjoxNjE3MzY5MTc4LCJzdWIiOiIxIiwic2NvcGVzIjpbIm1lbWJlciJdfQ.igRML7KCPfdGcK3czP6jUJ0k0NZ4Q3zEx580qRqqoxhGxCiQOcAZKBvLN_BtHnXjAm3rhCiP369NcROWsQLiMp61Fc5NwGP2pSdD6DalLD6JuDPvxTyLapPUTEt2Iy43hIW0jMhkc8MTpAA9XiuQFpFZ4cop0G-_csG2Cy11D7OLUViIYqNevBkC76A2yhrs7TNd909JcL3EgcujguyFuwBpEoM_Snheib0qKQ1iw_tFjraiSyIldQ2QhZeaamRl8L58jQ8crXDCl9fcQnR7Yxnd55PkGoS5O7K_rSEka7Uly3PRQ7xT6aCrTLNjzo8D3tO2xk1HaZ2bgCW5Yi4tCgpgi1bW9CVgeu8-Pi6wPXxtBrvL-GmteaYFx4HGFpNOwijEnCXsYcVyGkkhND2VDrb79Y8rt-VGJui0UoBfB_HQ6kEdGxgOzkHqJBVz6y6rbR0Va6SNBD3VJgkawt_BHTROq2V-ljszQWm9giid0ZGpiYl_LDwsGB8iHL2yvqQXTrujrFXl4CzuRJtBma-T-WU_KnxZ3_-nxa1bE4GtHStoFZkpf40Q0ixDvmKmYT8lK_GoadksrMe_phO_esMlPy3Rmpc4wmUEf3Zm_kAkB9hKZLd9eXn38xo3x2IgerYOiz6ZszQDCDac9VjLQ4_4rQoq0NZH6kJSI2uYW9yz-yo"
  });
  if (response.statusCode == 200) {
    print(response.body);
    return UserProject.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to Load');
  }
}

class DashboardState extends State<Dashboard> {
  Future<UserProject> futureAlbum;

  @override
  void initState() {
    /*  bloc.getUserProject(); */
    super.initState();
    futureAlbum = getUserProject();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 70,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FutureBuilder<UserProject>(
                      future: futureAlbum,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(
                            snapshot.data.projectName,
                            style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                          );
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }
                        return CircularProgressIndicator();
                      },
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    FutureBuilder<UserProject>(
                      future: futureAlbum,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(
                            snapshot.data.projectType,
                            style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                    color: Color(0xffa29aac),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600)),
                          );
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }
                        return CircularProgressIndicator();
                      },
                    ),
                  ],
                ),
                IconButton(
                  alignment: Alignment.topCenter,
                  icon: Image.asset(
                    "assets/logo.png",
                    width: 24,
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          GridDashboard()
        ],
      ),
    );
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
              textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
      ],
    ),
  );
}
