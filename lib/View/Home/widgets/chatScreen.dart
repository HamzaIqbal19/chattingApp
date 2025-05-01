import 'package:chatting_app/View/Constants/app_assets.dart';
import 'package:chatting_app/View/Constants/app_dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          leading: Stack(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage("assets/images/person.png"),
              ),
              Positioned(
                  right: 0,
                  bottom: AppDimensions.height10(context) * 1,
                  child: Container(
                    height: AppDimensions.height10(context) * 1,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(30)),
                  ))
            ],
          ),
          title: Text("Hamza"),
          subtitle: Text("Active Now"),
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: ImageIcon(AssetImage(AppAssets.call))),
          IconButton(
              onPressed: () {}, icon: ImageIcon(AssetImage(AppAssets.video))),
        ],
      ),
      bottomNavigationBar: Card(
        color: Color(0xffFFFFFF),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        margin: EdgeInsets.only(top: AppDimensions.height10(context) * 2.5),
        child: Container(
          color: Color(0xffFFFFFF),
          height: AppDimensions.height10(context) * 10,
          child: Padding(
            padding: EdgeInsets.only(
              left: 15,
              right: 20,
            ),
            child: Row(
              children: [
                GestureDetector(
                    child: ImageIcon(AssetImage(AppAssets.attachment))),
                SizedBox(
                  width: AppDimensions.width10(context) * 1.5,
                ),
                Expanded(
                  child: Container(
                    height: AppDimensions.height10(context) * 6,
                    decoration: BoxDecoration(
                      color: Color(0XffF3F6F6),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextFormField(
                      cursorColor: Color.fromARGB(255, 132, 133, 133),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                              left: AppDimensions.width10(context) * 1,
                              top: AppDimensions.width10(context) * 1.3),
                          hintStyle: TextStyle(
                              color: Color(0xff797C7B),
                              fontFamily: 'Circular',
                              fontSize: AppDimensions.font10(context) * 1.6),
                          hintText: "Write your message",
                          border: InputBorder.none,
                          suffixIcon: IconButton(
                            icon: ImageIcon(
                              AssetImage(AppAssets.files),
                              color: Color(0XFF797C7B),
                            ),
                            onPressed: () {},
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  width: AppDimensions.width10(context) * 1.5,
                ),
                GestureDetector(child: ImageIcon(AssetImage(AppAssets.camera))),
                SizedBox(
                  width: AppDimensions.width10(context) * 1.5,
                ),
                GestureDetector(
                    child: ImageIcon(AssetImage(AppAssets.microphone))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
