import 'package:chatting_app/View/Constants/app_assets.dart';
import 'package:chatting_app/View/Constants/app_dimensions.dart';
import 'package:chatting_app/View/onBoarding/onBoarding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 3),
  )..forward();

  late final Animation<Offset> animationForC = Tween<Offset>(
          begin: const Offset(0, -4), end: Offset.zero) // top to bottom slide
      .animate(CurvedAnimation(
    parent: controller,
    curve: Curves.easeInOut,
  ));
  late AnimationController controller1 = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 3),
  )..forward();

  late final Animation<Offset> animationForChat = Tween<Offset>(
          begin: const Offset(4.4, 0), end: Offset.zero) //right to left slide
      .animate(CurvedAnimation(
    parent: controller,
    curve: Curves.easeInOut,
  ));

  // ignore: annotate_overrides
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const OnBoarding()));
    });
  }

  @override
  void dispose() {
    controller.dispose();
    controller1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: SizedBox(
            height: AppDimensions.height10(context) * 8,
            width: AppDimensions.height10(context) * 20,
            child: SlideTransition(
              position: animationForC,
              child: const Image(
                image: AssetImage(AppAssets.C),
              ),
            ),
          )),
          SizedBox(
            height: AppDimensions.height10(context) * 8,
            width: AppDimensions.height10(context) * 20,
            child: SlideTransition(
              position: animationForChat,
              child: const Image(
                image: AssetImage(AppAssets.chatBox),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
