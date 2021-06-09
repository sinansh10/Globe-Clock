import 'package:flutter/material.dart';
import 'package:world_time/services/get_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void setWorldTime() async {
    WorldTime instance = WorldTime(location: 'Detroit', countryFlag: 'clock.jpg', url: 'America/Detroit');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.countryFlag,
      'time': instance.showTime,
      'isDay': instance.isDay,
    });
  }

  @override
  void initState() {
    super.initState();
    setWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
          child: SpinKitWave(
            color: Colors.white,
            size: 80.0,
          ),
      )
    );
  }
}
