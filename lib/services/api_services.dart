
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:forecast/ui/components/common_toast.dart';
import 'package:http/http.dart' as http;

import '../models/weather_model.dart';

class WheatherServices{
 static var client=http.Client();

  static Future<dynamic> getWheatherData()async{
    try{
      var apiKey = dotenv.env['API_KEY'];
      var response=await client.get(Uri.parse('https://api.weatherapi.com/v1/current.json?q=kannur&key=$apiKey'));
    if(response.statusCode==200){
      var jsondata=response.body;
      return weatherFromJson(jsondata);
    }else{
      commonToast(message: 'model exception');
   return null;
    }
  }catch(e){
    commonToast(message: 'server side exception');
  }
    }
}