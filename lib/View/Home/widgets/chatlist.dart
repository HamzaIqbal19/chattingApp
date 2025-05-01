import 'package:chatting_app/View/Constants/routeNames.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RouteNames.chats);
      },
      child: ListView.builder(
          itemCount: 15,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return const ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage("assets/images/person.png"),
              ),
              title: Text("Hamza"),
              subtitle: Text("How are youuu"),
              trailing: Column(
                children: [
                  Text("2 mins"),
                  Text(
                    "3",
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
            );
          }),
    );
  }
}
