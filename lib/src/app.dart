import 'package:flutter/material.dart';
import 'package:petanic/src/screens/login.dart';
    
class PetanicApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Scaffold(
        body : Login(),
      ),
      debugShowCheckedModeBanner: false,

    );
  }
}
