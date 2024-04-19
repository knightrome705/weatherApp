import 'package:flutter/material.dart';
import 'package:forecast/provider/home_provider.dart';
import 'package:forecast/routes/routes_name.dart';
import 'package:forecast/ui/components/app_style.dart';
import 'package:forecast/utils/colors.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<HomeProvider>(context,listen: false);
    provider.getCurrentWeather();
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            colors: [
              secondary,
              primary
            ]
          )
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 200,
                  decoration:const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assests/images/weather.png')
                    )
                  ),
                ),
                Consumer<HomeProvider>(
                  builder: (context,data,_) {
                   return Text("${data.weather?.current.tempC ?? 'nodata'} C", style: AppTextStyle.heading2);
                  }
                ),
                Consumer<HomeProvider>(
                  builder: (context,data,_) {
                    return  Text(data.weather?.location.region??'nodata',style:const TextStyle(fontSize: 20,color: Colors.white),);
                  }
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Max:24',style: TextStyle(fontSize: 20,color: Colors.white),),
                    SizedBox(width:10,),
                    Text('Min:18',style: TextStyle(fontSize: 20,color: Colors.white),)
                  ],
                ),
                Container(
                  height: 200,
                  decoration:const BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(image: AssetImage('assests/images/home.png'))
                  ),
                ),
                 Container(
                  padding:const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      colors: [
                    
                      secondary,
                      primary
                    ])
                  ),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Today',style: TextStyle(fontSize: 20,color: Colors.white),),
                            Text('July,21',style: TextStyle(fontSize: 20,color: Colors.white),),
                          ],
                        ),
                      ),
                     const Divider(thickness: 0.5,color: Colors.white,),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('19c',style: AppTextStyle.basic,),
                          Text('18c',style: AppTextStyle.basic,),
                          Text('18c',style: AppTextStyle.basic,),
                          Text('18c',style: AppTextStyle.basic,),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset('assests/images/weather.png',height: 80,),
                          Image.asset('assests/images/weather.png',height: 80,),
                          Image.asset('assests/images/weather.png',height: 80,),
                          Image.asset('assests/images/weather.png',height: 80,),
                        ],
                      ),
                     const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('15.00',style: AppTextStyle.basic,),
                          Text('16.00',style: AppTextStyle.basic,),
                          Text('17.00',style: AppTextStyle.basic,),
                          Text('18.00',style: AppTextStyle.basic,),
                        ],
                      )
                    ],
                  ),
                ),
               const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                   const Icon(Icons.location_on,color: Colors.white,),
                    InkWell(onTap: ()=>Navigator.pushReplacementNamed(context, RouteName.mainscreen), 
                     child:const Icon(Icons.add,color: Colors.white,)),
                   const Icon(Icons.menu,color: Colors.white,)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}