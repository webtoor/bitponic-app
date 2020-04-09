import 'package:bitponic/src/models/user_project.dart';
/* import 'package:flutter/foundation.dart'; */
import 'package:http/http.dart' show Client;
import 'dart:convert';

class ApiProvider {
  Client client = Client();
  final _url = "http://192.168.1.4:8000/api/v1";

  Future login(email, password) async {
    var body = json.encode({
      "email": email,
      "password": password,
    });
    //print(body);

    final response = await client.post("$_url/login", body: body, headers: {
      "content-type": "application/json",
      "accept": "application/json",
    });
    print(response.body);
    if (response.statusCode == 200) {
      Map data = json.decode(response.body);
      if(data['access_token'] != null){
        return true;
      }else if(data['error'] != null){
        return false; 
      }
    }else{
      return false;
    } 
  }


   Future <UserProject> getUserProject() async {
    //print('panggil data');
    final response = await client.get("$_url/user-project", headers: {
      "content-type": "application/json",
      "accept": "application/json",
      "Authorization" : "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMWYyMGJiZWVmNGNkNTkxMTEzZmU4NTBjODUyNzA2ODZlMWU1ZjA3YTRmZmFlNjNjYTE1NGMzOWNjOTI0NTNhYzU0MzEzMTc2ZWJmMTFlMDYiLCJpYXQiOjE1ODU4MzMxNzgsIm5iZiI6MTU4NTgzMzE3OCwiZXhwIjoxNjE3MzY5MTc4LCJzdWIiOiIxIiwic2NvcGVzIjpbIm1lbWJlciJdfQ.igRML7KCPfdGcK3czP6jUJ0k0NZ4Q3zEx580qRqqoxhGxCiQOcAZKBvLN_BtHnXjAm3rhCiP369NcROWsQLiMp61Fc5NwGP2pSdD6DalLD6JuDPvxTyLapPUTEt2Iy43hIW0jMhkc8MTpAA9XiuQFpFZ4cop0G-_csG2Cy11D7OLUViIYqNevBkC76A2yhrs7TNd909JcL3EgcujguyFuwBpEoM_Snheib0qKQ1iw_tFjraiSyIldQ2QhZeaamRl8L58jQ8crXDCl9fcQnR7Yxnd55PkGoS5O7K_rSEka7Uly3PRQ7xT6aCrTLNjzo8D3tO2xk1HaZ2bgCW5Yi4tCgpgi1bW9CVgeu8-Pi6wPXxtBrvL-GmteaYFx4HGFpNOwijEnCXsYcVyGkkhND2VDrb79Y8rt-VGJui0UoBfB_HQ6kEdGxgOzkHqJBVz6y6rbR0Va6SNBD3VJgkawt_BHTROq2V-ljszQWm9giid0ZGpiYl_LDwsGB8iHL2yvqQXTrujrFXl4CzuRJtBma-T-WU_KnxZ3_-nxa1bE4GtHStoFZkpf40Q0ixDvmKmYT8lK_GoadksrMe_phO_esMlPy3Rmpc4wmUEf3Zm_kAkB9hKZLd9eXn38xo3x2IgerYOiz6ZszQDCDac9VjLQ4_4rQoq0NZH6kJSI2uYW9yz-yo"
    });
    if(response.statusCode == 200) {
      print(response.body);
      return UserProject.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to Load');
    }
  }

}
