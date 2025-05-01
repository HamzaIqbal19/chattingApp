import 'package:chatting_app/View/Constants/routeFactories.dart' as route;
import 'package:chatting_app/View/Splash/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //   return MaterialApp(
    //       title: 'Flutter Demo', theme: ThemeData(), home: const SplashScreen());
    // }
    return MaterialApp(
      onGenerateRoute: route.RouteFactories.generateRoute,
      theme: ThemeData(
        primarySwatch: Colors.green, // Set the app's primary theme color
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
