import 'package:flutter/material.dart';
import 'package:bitponic/src/screen/login.dart';

void main() => runApp(MaterialApp(
      home: BitponicApp(),
      debugShowCheckedModeBanner: false,
    ));
    
class BitponicApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Login()
    );
  }
}
