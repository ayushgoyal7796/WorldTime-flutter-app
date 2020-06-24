import 'package:flutter/material.dart';
import 'package:worldtime/screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'World Time',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
