import 'package:chatting_app/View/Constants/app_assets.dart';
import 'package:chatting_app/View/Constants/app_dimensions.dart';
import 'package:chatting_app/View/Constants/routeNames.dart';
import 'package:chatting_app/View/Widgets/CustomButton.dart';
import 'package:chatting_app/View/Widgets/bottomNavigation.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: SizedBox(
            height: AppDimensions.height10(context) * 10,
            width: AppDimensions.height10(context) * 8,
            child: const Image(
              image: AssetImage(AppAssets.cChatBox),
            ),
          )),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                stops: [0.5, 0.3, 1],
                begin: Alignment.topRight,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0XFF0A1832),
                  Color(0xff204998),
                  Color(0XFF0A1832),
                ])),
        child: SizedBox.expand(
          child: Padding(
            padding: EdgeInsets.only(
              left: AppDimensions.width10(context) * 3,
              right: AppDimensions.width10(context) * 3,
              // bottom: AppDimensions.width10(context) * 2,
              top: AppDimensions.width10(context) * 8,
            ),
            child: Column(
              children: [
                SizedBox(
                  child: Text(
                    "Connect friends",
                    style: TextStyle(
                        fontSize: AppDimensions.font10(context) * 9,
                        fontFamily: 'Caros',
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  child: Text(
                    "easily & quickly",
                    style: TextStyle(
                        fontSize: AppDimensions.font10(context) * 9,
                        fontFamily: 'Caros',
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 1,
                ),
                SizedBox(
                  child: Text(
                    "Our chat app is the perfect way to stay connected with friends and family.",
                    style: TextStyle(
                        fontSize: AppDimensions.font10(context) * 2,
                        fontFamily: 'Circular',
                        fontWeight: FontWeight.w400,
                        color: const Color(0XFFB9C1BE)),
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 2,
                ),
                SizedBox(
                  // height: AppDimensions.height10(context) * 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: AppDimensions.height10(context) * 6,
                        width: AppDimensions.height10(context) * 6,
                        child: const Image(
                          image: AssetImage(AppAssets.blackFacebook),
                        ),
                      ),
                      SizedBox(
                        width: AppDimensions.height10(context) * 3,
                      ),
                      SizedBox(
                        height: AppDimensions.height10(context) * 6,
                        width: AppDimensions.height10(context) * 6,
                        child: const Image(
                          image: AssetImage(AppAssets.blackGoogle),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 3,
                ),
                const Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Color(0XFFCDD1D0), // Divider color
                        thickness: 0.5, // Thickness of the divider
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 8), // Space around text/icon
                      child: Text("OR",
                          style: TextStyle(
                              color: Color(0xffD6E4E0))), // Middle content
                    ),
                    Expanded(
                      child: Divider(
                        color: Color(0XFFCDD1D0),
                        thickness: 0.5,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 1.7,
                ),
                CustomButton().appButton(context, onPressed: () {
                  //  Navigator.pushNamed(context, RouteNames.signUp);
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => BottomNavigation()));
                  // Navigator.pushNamed(context, RouteNames.home);
                },
                    buttonText: "Sign up with mail",
                    buttonBgColor: Colors.white,
                    textColor: Colors.black),
                SizedBox(
                  height: AppDimensions.height10(context) * 1.7,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Existing account?",
                        style: TextStyle(
                            color: const Color(0XFFB9C1BE),
                            fontSize: AppDimensions.font10(context) * 1.5,
                            fontFamily: 'Caros')),
                    SizedBox(
                      width: AppDimensions.height10(context) * 0.5,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, RouteNames.login);
                      },
                      child: Text("Log in",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: AppDimensions.font10(context) * 1.5,
                              fontFamily: 'Caros')),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
