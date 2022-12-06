import 'dart:convert';
import 'package:world_time/services/world_time.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class loading extends StatefulWidget {
  const loading({Key? key}) : super(key: key);

  @override
  State<loading> createState() => _loadingState();
}

class _loadingState extends State<loading> {


void setupWorldTime() async {
  WorldTime instance =WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
  await instance.getTime();
  Navigator.pushReplacementNamed(context, '/home',arguments: {
    'location': instance.location,
    'flag': instance.flag,
    'time': instance.time,
    'isDaytime' : instance.isDaytime,
  });
}
  @override
  void initState() {

    super.initState();
    setupWorldTime();


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent[400],
       body: Center(
          child:  SpinKitHourGlass(
            color: Colors.white,
            size: 80.0,
          ),
       )
    );
  }
}
