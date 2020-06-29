import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';

class ChooseLocationScreen extends StatefulWidget {
  @override
  _ChooseLocationScreenState createState() => _ChooseLocationScreenState();
}

class _ChooseLocationScreenState extends State<ChooseLocationScreen> {
  List<WorldTimeService> locations = [
    WorldTimeService(location: 'London', flag: 'uk.png', url: 'Europe/London'),
    WorldTimeService(
        location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin'),
    WorldTimeService(
        location: 'Athens', flag: 'greece.png', url: 'Europe/Athens'),
    WorldTimeService(location: 'Cairo', flag: 'egypt.png', url: 'Africa/Cairo'),
    WorldTimeService(
        location: 'Nairobi', flag: 'kenya.png', url: 'Africa/Nairobi'),
    WorldTimeService(
        location: 'Chicago', flag: 'usa.png', url: 'America/Chicago'),
    WorldTimeService(
        location: 'New York', flag: 'usa.png', url: 'America/New_York'),
    WorldTimeService(
        location: 'Seoul', flag: 'south_korea.png', url: 'Asia/Seoul'),
    WorldTimeService(
        location: 'Jakarta', flag: 'indonesia.png', url: 'Asia/Jakarta'),
  ];

  void updateTime(int index) async {
    WorldTimeService _worldTime = locations[index];
    await _worldTime.getTime();
    Navigator.pop(
      context,
      {
        'location': _worldTime.location,
        'flag': _worldTime.flag,
        'time': _worldTime.time,
        'isDayTime': _worldTime.isDayTime,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose Location'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: ListTile(
              onTap: () {
                updateTime(index);
              },
              leading: CircleAvatar(
                backgroundImage:
                    AssetImage('assets/images/${locations[index].flag}'),
              ),
              title: Text(locations[index].location),
            ),
          );
        },
      ),
    );
  }
}
