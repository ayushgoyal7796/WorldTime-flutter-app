import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

class WorldTimeService {
  String location;
  String flag;
  String url;
  String time;
  bool isDayTime;

  WorldTimeService({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      Response response =
          await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];
      String offset = data['utc_offset'];
      String offsetHours = offset.substring(1, 3);
      String offsetMinutes = offset.substring(4, 6);

      DateTime now = DateTime.parse(datetime);
      now = offset[0] == '+'
          ? now.add(Duration(
              hours: int.parse(offsetHours), minutes: int.parse(offsetMinutes)))
          : now.subtract(Duration(
              hours: int.parse(offsetHours),
              minutes: int.parse(offsetMinutes)));
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print(e.toString());
      time = 'could not get time';
    }
  }
}
