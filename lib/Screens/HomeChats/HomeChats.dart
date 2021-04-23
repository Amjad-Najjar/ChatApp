import 'package:chatfirebase/Screens/HomeChats/Component/MassegeRow.dart';
import 'package:chatfirebase/Screens/HomeChats/Component/TopBar.dart';
import 'package:chatfirebase/shared/constant.dart';
import 'package:flutter/material.dart';
class HomeChats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body:ListView(
        children:[
      TopBar(),
      SizedBox(height:SizeConfig.blockSizeVertical*2),
      MassegeRow(name: "Amgad Najjar",messagesCount: 4,header:"Hello "),
      MassegeRow(name: "Dad",messagesCount: 0,header:"Bring milk ",image:"images/1.jpg"),
      MassegeRow(name: "Mohammed",messagesCount: 2,header:"call me when you can",image: "images/2.jpg",),

      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor:Color(0xFF516091),
        child: Icon(Icons.chat_outlined,color: Colors.white),
      ),
    );
  }
}