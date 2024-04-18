import 'package:flutter/material.dart';
import 'package:forecast/routes/routes_name.dart';
import 'package:forecast/ui/pages/homescreen/home.dart';
import 'package:forecast/ui/pages/main/main.dart';
import 'package:forecast/ui/pages/splashscreen/splash.dart';

class Routes{
  static Route<dynamic> generateRoute(RouteSettings settings){
  switch(settings.name){
    case RouteName.splashscreen:
    return MaterialPageRoute(builder: (context) =>const Splash(),);
    case RouteName.homescreen:
    return MaterialPageRoute(builder: (context) =>const Home(),);
    case RouteName.mainscreen:
    return MaterialPageRoute(builder: (context) => const Main(),);
    default:
    return MaterialPageRoute(builder: (context) => Scaffold(body: Center(child: Text('No page Exists'),),),);
  }
  }
}