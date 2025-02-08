import 'package:chatting_app/View/Constants/routeNames.dart';
import 'package:chatting_app/View/HomeScreen/Home_screen.dart';
import 'package:chatting_app/View/LoginScreen/loginScreen.dart';
import 'package:chatting_app/View/SplashScreen/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteFactories {
  static GlobalKey<NavigatorState> splashKey = GlobalKey<NavigatorState>();
  static GlobalKey<NavigatorState> loginKey = GlobalKey<NavigatorState>();
  static GlobalKey<NavigatorState> homeKey = GlobalKey<NavigatorState>();
  static GlobalKey<NavigatorState> registerKey = GlobalKey<NavigatorState>();

  static const int splashIndex = 0;
  static const int loginIndex = 1;
  static const int homeIndex = 2;
  static const int registerIndex = 3;

  static GlobalKey<NavigatorState> _currentNavigator = splashKey;
  static GlobalKey<NavigatorState> get currentNavigator => _currentNavigator;

  static void updateCurrentNavigator(int currentIndex) {
    switch (currentIndex) {
      case splashIndex:
        _currentNavigator = splashKey;
      case loginIndex:
        _currentNavigator = loginKey;
      case homeIndex:
        _currentNavigator = homeKey;
      case registerIndex:
        _currentNavigator = registerKey;
    }
  }

  static Route generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteNames.splash:
        return CupertinoPageRoute(
            settings: routeSettings,
            builder: (context) => const SplashScreen());
      case RouteNames.home:
        return CupertinoPageRoute(
            settings: routeSettings, builder: (context) => const HomeScreen());
      case RouteNames.login:
        return CupertinoPageRoute(
            settings: routeSettings, builder: (context) => const LoginScreen());
      // case RouteNames.register:
      //   return CupertinoPageRoute(
      //       settings: routeSettings,
      //       builder: (context) => const SplashScreen());
      default:
        return errorRoute;
    }
  }

  static Route get errorRoute => MaterialPageRoute(
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Error'),
            ),
            body: const Center(child: Text('Error')),
          );
        },
      );
}
