import 'package:bitponic/src/screens/dashboard.dart';
import 'package:flutter/material.dart';
/* import 'package:bitponic/src/screens/login.dart'; */
    
class BitponicApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Scaffold(
        body : Dashboard(),
      ),
      debugShowCheckedModeBanner: false,

    );
  }
}
