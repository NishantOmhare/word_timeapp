

import 'package:flutter/material.dart';
import 'package:world_time/pakages/home.dart';
import 'package:world_time/pakages/chose_location.dart';
import 'package:world_time/pakages/loading.dart';
void main()=>runApp(MaterialApp(
  initialRoute: '/' ,
  routes: {
    '/': (context)=> loading(),
    '/home': (context)=> home(),
    '/location': (context)=> choselocation()
  },
));

