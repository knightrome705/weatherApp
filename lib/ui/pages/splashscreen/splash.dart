import 'package:flutter/material.dart';
import 'package:forecast/ui/components/app_style.dart';
import 'package:forecast/ui/pages/homescreen/home.dart';
import 'package:forecast/utils/colors.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            colors: [
              secondary,
              primary,
              
            ]
          )
        ),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: 400,
                width: 200,
                decoration:const BoxDecoration(
                  image: DecorationImage(image: AssetImage('assests/images/weather.png'))
                ),
              ),
             const SizedBox(
                height: 80,
              ),
              Text('Weather',style: AppTextStyle.heading,),
            //  const SizedBox(height:5,),
             Text('ForeCasts',style: AppTextStyle.heading1,),
           const  SizedBox(
              height: 10,
             ),
             InkWell(
              onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>const Home(),)),
               child: Container(
                padding:const EdgeInsets.symmetric(horizontal: 100,vertical:15),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 228, 206, 6),
                  borderRadius: BorderRadius.circular(30)
                ),
                child:const Text('Get Start',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
               ),
             )
            ],
          ),
        ),
      ),
    );
  }
}