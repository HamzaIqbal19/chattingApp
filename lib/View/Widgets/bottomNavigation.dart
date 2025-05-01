import 'package:chatting_app/View/Constants/app_assets.dart';
import 'package:chatting_app/View/Home/homeScreen.dart';
import 'package:chatting_app/View/Login/loginScreen.dart';
import 'package:chatting_app/View/SignUp/signupScreen.dart';
import 'package:chatting_app/View/onBoarding/onBoarding.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  // void itemList(){}
  int selectIndex = 0;
  List itemList = [HomeScreen(), SignUpScreen(), LoginScreen(), OnBoarding()];

  void onItemTapped(int index) {
    setState(() {
      selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: itemList.elementAt(selectIndex),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0XFF24786D),
        unselectedItemColor: Color(0XFF797C7B),
        selectedLabelStyle: TextStyle(fontSize: 12), // Reduce font size
        unselectedLabelStyle: TextStyle(fontSize: 12), //
        onTap: onItemTapped,
        currentIndex: selectIndex,
        items: const [
          BottomNavigationBarItem(
              icon: SizedBox(
                child: ImageIcon(
                  AssetImage(AppAssets.message),
                ),
              ),
              label: "Message"),
          BottomNavigationBarItem(
              icon: SizedBox(
                child: ImageIcon(
                  AssetImage(AppAssets.callbottom),
                ),
              ),
              label: "Calls"),
          BottomNavigationBarItem(
              icon: SizedBox(
                child: ImageIcon(
                  AssetImage(AppAssets.user),
                ),
              ),
              label: "Contacts"),
          BottomNavigationBarItem(
              icon: SizedBox(
                child: ImageIcon(
                  //size: 40,
                  AssetImage(AppAssets.meeting),
                ),
              ),
              label: "Meeting")
        ],
      ),
    );
  }
}
