import 'package:flutter/material.dart';
import 'package:forecast/routes/routes_name.dart';
import 'package:forecast/ui/components/app_style.dart';
import 'package:forecast/utils/colors.dart';
import 'package:provider/provider.dart';

import '../../../provider/homeprovider/home_provider.dart';

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeProvider>(context, listen: false);
    // provider.getCurrentCordinte();
    provider.getCurrentWeather();
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomRight, colors: [secondary, primary])),
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            Consumer<HomeProvider>(builder: (context, data, _) {
              return Text(
                data.weather?.location.country ?? 'nodata',
                style: AppTextStyle.basic.copyWith(fontSize: 25),
              );
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer<HomeProvider>(
                  builder: (context,data,_) {
                    return Text(
                      'C:${data.weather?.current.tempC}',
                      style: AppTextStyle.basic.copyWith(fontSize: 20),
                    );
                  }
                ),
                const SizedBox(
                  width: 10,
                ),
                Consumer<HomeProvider>(
                  builder: (context,data,_) {
                    return Text(
                      'F:${data.weather?.current.tempF}',
                      style: AppTextStyle.basic.copyWith(fontSize: 20),
                    );
                  }
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Text(
                  '7-Days ForeCast',
                  style: AppTextStyle.basic
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 150,
              child: ListView.separated(
                itemCount: 7,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return const Forecasts();
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    width: 5,
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft, colors: [secondary, primary])),
              child: Column(
                children: [
                  const Row(
                    children: [
                      Icon(
                        Icons.abc,
                        color: Colors.white,
                        size: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'AIR QUALITY',
                        style: AppTextStyle.basic,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        '3-Low Health Risk',
                        style: AppTextStyle.basic.copyWith(fontSize: 25),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Divider(
                    thickness: 0.5,
                    color: Colors.white,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'See more',
                        style: AppTextStyle.basic,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: Colors.white,
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Row(
              children: [
                DayLight(),
                Spacer(),
                DayLight(),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () => Navigator.pushReplacementNamed(
                        context, RouteName.homescreen),
                    child: const Icon(
                      Icons.menu_sharp,
                      size: 80,
                      color: Colors.white,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}

class DayLight extends StatelessWidget {
  const DayLight({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.white,
          ),
          gradient: LinearGradient(
              begin: Alignment.bottomRight, colors: [secondary, primary])),
      child: Column(
        children: [
          const Row(
            children: [
              Icon(
                Icons.sunny,
                size: 40,
                color: Colors.white,
              ),
              Text(
                'SUNRISE',
                style: AppTextStyle.basic,
              )
            ],
          ),
          Row(
            children: [
              Text(
                '5:28 AM',
                style: AppTextStyle.basic.copyWith(fontSize: 25),
              )
            ],
          ),
          const Row(
            children: [
              Text(
                'Sunset:7.25PM',
                style: AppTextStyle.basic,
              )
            ],
          )
        ],
      ),
    );
  }
}

class Forecasts extends StatelessWidget {
  const Forecasts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
              begin: Alignment.bottomRight, colors: [secondary, primary])),
      child: Center(
        child: Column(
          children: [
            const Text(
              '19c',
              style: AppTextStyle.basic,
            ),
            Image.asset(
              'assests/images/weather.png',
              height: 80,
            ),
            const Text(
              'Mon',
              style: AppTextStyle.basic,
            )
          ],
        ),
      ),
    );
  }
}
