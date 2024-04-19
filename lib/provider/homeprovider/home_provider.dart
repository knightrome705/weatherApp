import 'package:flutter/material.dart';
import 'package:forecast/models/weather_model.dart';
import 'package:forecast/services/api_services.dart';
import 'package:forecast/ui/components/common_toast.dart';
// import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class HomeProvider extends ChangeNotifier{
  Weather? weather;
  Future<void> getCurrentWeather()async{
     try{
      weather= await  WheatherServices.getWheatherData();
     notifyListeners();
     }catch(e){
      commonToast(message: e.toString());
     }
  }
  void getCurrentCordinte()async{
    try{
      final position=await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    getCurrentPosition(latitude:position.latitude,longitude: position.longitude);
    }catch(e){
      commonToast(message: e.toString());
    }
  }
  void getCurrentPosition({required  latitude,required  longitude})async{
    try{
      // List<Placemark> location=await placemarkFromCoordinates(latitude, longitude);   //try to get the current state
    // print(location.first.street);
    }catch(e){
      commonToast(message: e.toString());
    }
  }
}