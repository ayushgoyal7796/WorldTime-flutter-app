import 'package:flutter/material.dart';
import 'package:worldtime/screens/choose_location.dart';
import 'package:worldtime/screens/home.dart';
import 'package:worldtime/screens/loading.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'World Time',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoadingScreen(),
        '/home': (context) => HomeScreen(),
        '/choose_location': (context) => ChooseLocationScreen(),
      },
    );
  }
}
