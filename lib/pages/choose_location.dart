import 'package:flutter/material.dart';
import 'package:world_time/services/get_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(location: 'Detroit', countryFlag: 'clock.jpg', url: 'America/Detroit'),
    WorldTime(location: 'Kolkata', countryFlag: 'clock.jpg', url: 'Asia/Kolkata'),
    WorldTime(location: 'Chicago', countryFlag: 'clock.jpg', url: 'America/Chicago'),
    WorldTime(location: 'New York', countryFlag: 'clock.jpg', url: 'America/New_York'),
    WorldTime(location: 'Seoul', countryFlag: 'clock.jpg', url: 'Asia/Seoul'),
    WorldTime(location: 'Jakarta', countryFlag: 'clock.jpg', url: 'Asia/Jakarta'),
    WorldTime(location: 'Nairobi', countryFlag: 'clock.jpg', url: 'Africa/Nairobi'),
    WorldTime(location: 'London', countryFlag: 'clock.jpg', url: 'Europe/London'),
    WorldTime(location: 'Berlin', countryFlag: 'clock.jpg', url: 'Europe/Berlin'),
    WorldTime(location: 'Paris', countryFlag: 'clock.jpg', url: 'Europe/Paris')
  ];

  void updateTime(index) async{
    WorldTime ins = locations[index];
    await ins.getTime();
    Navigator.pop(context, {
      'location': ins.location,
      'flag': ins.countryFlag,
      'time': ins.showTime,
      'isDay': ins.isDay,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[300],
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent[100],
        title: Text('Choose Location'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.15, horizontal: 4.0),
            child: Card(
              child: ListTile(
                tileColor: Colors.black12,
                onTap: () {
                  updateTime(index);
                  //print(locations[index].location);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].countryFlag}'),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
