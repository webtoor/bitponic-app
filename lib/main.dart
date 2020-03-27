import 'package:flutter/material.dart';
import 'login.dart';

void main() => runApp(BitponicApp());

class BitponicApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Login()
    );
  }
}
