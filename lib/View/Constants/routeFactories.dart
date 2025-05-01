import 'package:chatting_app/View/Constants/routeNames.dart';
import 'package:chatting_app/View/Home/homeScreen.dart';
import 'package:chatting_app/View/Home/widgets/chatScreen.dart';
import 'package:chatting_app/View/onBoarding/onBoarding.dart';
import 'package:chatting_app/View/Login/loginScreen.dart';
import 'package:chatting_app/View/SignUp/signupScreen.dart';
import 'package:chatting_app/View/Splash/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteFactories {
  static GlobalKey<NavigatorState> splashKey = GlobalKey<NavigatorState>();
  static GlobalKey<NavigatorState> loginKey = GlobalKey<NavigatorState>();
  static GlobalKey<NavigatorState> onBoardingKey = GlobalKey<NavigatorState>();
  static GlobalKey<NavigatorState> registerKey = GlobalKey<NavigatorState>();
  static GlobalKey<NavigatorState> homeKey = GlobalKey<NavigatorState>();
  static GlobalKey<NavigatorState> chatKey = GlobalKey<NavigatorState>();

  static const int splashIndex = 0;
  static const int loginIndex = 1;
  static const int onBoardingIndex = 2;
  static const int registerIndex = 3;
  static const int homeIndex = 4;
  static const int chatIndex = 5;

  static GlobalKey<NavigatorState> _currentNavigator = splashKey;
  static GlobalKey<NavigatorState> get currentNavigator => _currentNavigator;

  static void updateCurrentNavigator(int currentIndex) {
    switch (currentIndex) {
      case splashIndex:
        _currentNavigator = splashKey;
      case loginIndex:
        _currentNavigator = loginKey;
      case onBoardingIndex:
        _currentNavigator = onBoardingKey;
      case registerIndex:
        _currentNavigator = registerKey;
      case homeIndex:
        _currentNavigator = homeKey;
      case chatIndex:
        _currentNavigator = chatKey;
    }
  }

  static Route generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteNames.splash:
        return CupertinoPageRoute(
            settings: routeSettings,
            builder: (context) => const SplashScreen());
      case RouteNames.onBoarding:
        return CupertinoPageRoute(
            settings: routeSettings, builder: (context) => const OnBoarding());
      case RouteNames.login:
        return CupertinoPageRoute(
            settings: routeSettings, builder: (context) => const LoginScreen());
      case RouteNames.signUp:
        return CupertinoPageRoute(
            settings: routeSettings,
            builder: (context) => const SignUpScreen());
      case RouteNames.home:
        return CupertinoPageRoute(
            settings: routeSettings, builder: (context) => const HomeScreen());
      case RouteNames.chats:
        return CupertinoPageRoute(
            settings: routeSettings, builder: (context) => const ChatScreen());
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
