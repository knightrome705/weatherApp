import 'package:flutter/material.dart';
import 'package:forecast/models/weather_model.dart';
import 'package:forecast/services/api_services.dart';

class HomeProvider extends ChangeNotifier{
  Weather? weather;
  Future<void> getCurrentWeather()async{
     weather= await  WheatherServices.getWheatherData();
     notifyListeners();
  }
}