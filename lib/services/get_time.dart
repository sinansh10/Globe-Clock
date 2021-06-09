import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location;
  String showTime;
  String countryFlag;
  String url;
  bool isDay;

  WorldTime({this.location, this.countryFlag, this.url});

  Future<void> getTime() async {

    try{
      Response time = await get('https://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(time.body);
      //print(data);

      String datetime = data['utc_datetime'];
      String offset = data['utc_offset'];
      String flag = offset[0];
      //print(datetime);
      //print(offset);

      DateTime now = DateTime.parse(datetime);
      //print(now);

      DateTime locTime;

      if(flag=='+'){
        locTime = now.add(Duration(seconds:data['raw_offset']));
      }
      else{
        locTime = now.add(Duration(seconds:data['raw_offset']+3600));
      }
      //print(locTime);
      isDay = locTime.hour > 6 && locTime.hour < 19 ? true : false;
      showTime = DateFormat.jm().format(locTime);

    }
    catch(e){
      print('error : $e');
      showTime = 'No time data';
    }



  }


}





