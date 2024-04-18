import 'package:flutter/material.dart';
import 'package:forecast/provider/home_provider.dart';
import 'package:forecast/routes/routes_name.dart';
import 'package:provider/provider.dart';

import 'routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:(context) => HomeProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // home: const Splash(),
        initialRoute: RouteName.splashscreen,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}

