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

}
