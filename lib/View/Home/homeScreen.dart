import 'package:chatting_app/View/Constants/app_assets.dart';
import 'package:chatting_app/View/Constants/app_dimensions.dart';
import 'package:chatting_app/View/Home/widgets/chatlist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int itemLength = 10;
  String name = 'My Status';
  List users = ['My Status', 'Hamza', 'Aqsa', 'Ayesha', 'Samia', 'Yumna'];
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: SizedBox(),
        title: const Text(
          'LinkUp',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          InkWell(
            child: Padding(
              padding:
                  EdgeInsets.only(right: AppDimensions.width10(context) * 2),
              child: CircleAvatar(
                radius: 15,
                backgroundImage: AssetImage("assets/images/person.png"),
              ),
            ),
          )
        ],
      ),

      // bottom: PreferredSize(
      //   preferredSize: const Size(100, 150),
      //   child: Container(
      //     margin: EdgeInsets.only(
      //         bottom: AppDimensions.width10(context) * 3.7,
      //         left: AppDimensions.width10(context) * 2),
      //     child: Row(
      //       children: [
      //         SizedBox(
      //           //     width: AppDimensions.width10(context) * 1,
      //           child: SizedBox(
      //             height: AppDimensions.width10(context) * 12,
      //             width: AppDimensions.width10(context) * 40,
      //             child: ListView.builder(
      //                 scrollDirection: Axis.horizontal,
      //                 itemCount: users.length,
      //                 itemBuilder: (context, index) {
      //                   return Padding(
      //                     padding: EdgeInsets.only(
      //                         left: AppDimensions.width10(context) * 1.7,
      //                         top: AppDimensions.width10(context) * 0.8),
      //                     child: Stack(
      //                       children: [
      //                         Container(
      //                           decoration: BoxDecoration(
      //                               border: Border.all(
      //                                   color: Colors.grey, width: 2),
      //                               shape: BoxShape.circle,
      //                               color: Colors.transparent),
      //                           padding: EdgeInsets.all(2),
      //                           child: CircleAvatar(
      //                             radius:
      //                                 AppDimensions.width10(context) * 3.7,
      //                             backgroundImage: const AssetImage(
      //                                 "assets/images/person.png"),
      //                           ),
      //                         ),
      //                         index == 0
      //                             ? Positioned(
      //                                 right:
      //                                     AppDimensions.width10(context) *
      //                                         0,
      //                                 bottom:
      //                                     AppDimensions.width10(context) *
      //                                         2.7,
      //                                 child: Image(
      //                                   height:
      //                                       AppDimensions.width10(context) *
      //                                           2.3,
      //                                   width:
      //                                       AppDimensions.width10(context) *
      //                                           2.3,
      //                                   image: const AssetImage(
      //                                       AppAssets.plus),
      //                                 ))
      //                             : const SizedBox(),
      //                         Positioned(
      //                             bottom:
      //                                 AppDimensions.width10(context) * 0.7,
      //                             child: SizedBox(
      //                               width: AppDimensions.width10(context) *
      //                                   7.4,
      //                               child: Text(
      //                                 users[index].length > 6
      //                                     ? "${users[index].toString().trim().substring(0, 6)}.."
      //                                     : users[index],
      //                                 textAlign: TextAlign.center,
      //                                 style: TextStyle(
      //                                     color: Colors.white,
      //                                     fontSize: AppDimensions.font10(
      //                                             context) *
      //                                         1.6,
      //                                     fontFamily: 'Caros',
      //                                     fontWeight: FontWeight.w500),
      //                               ),
      //                             ))
      //                       ],
      //                     ),
      //                   );
      //                 }),
      //           ),
      //         )
      //       ],
      //     ),
      //   ),
      // )),

      body: Expanded(
        child: Column(
          children: [
            // Search Bar + TabBar
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 239, 239, 239),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: TextFormField(
                  cursorColor: Color.fromARGB(255, 132, 133, 133),
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.only(left: 10, right: 10, top: 10),
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    hintText: "Search",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Tab Bar
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  // color: Colors.grey[200],
                  //  borderRadius: BorderRadius.circular(10),
                  ),
              child: TabBar(
                physics: NeverScrollableScrollPhysics(),
                labelPadding:
                    EdgeInsets.only(left: 8.0, right: 8.0, top: 0, bottom: 0),
                padding: EdgeInsets.all(0),
                indicatorWeight: 0,
                controller: _tabController,
                indicator: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(20),
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                tabs: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: Tab(text: "All"),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: Tab(text: "Unread"),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: Tab(text: "Groups"),
                  ),
                ],
              ),
            ),

            // Fix: Wrap TabBarView inside Expanded
            Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: [
                  ChatListScreen(),
                  ChatListScreen(),
                  ChatListScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
