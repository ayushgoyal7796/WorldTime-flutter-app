import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  setupWorldTime() async {
    WorldTimeService _worldTime = WorldTimeService(
        location: 'USA',
        flag: 'assets/images/usa.png',
        url: 'America/New_York');
    await _worldTime.getTime();
    Navigator.pushReplacementNamed(
      context,
      '/home',
      arguments: {
        'location': _worldTime.location,
        'flag': _worldTime.flag,
        'time': _worldTime.time,
        'isDayTime': _worldTime.isDayTime,
      },
    );
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('loading screen'),
    );
  }
}
