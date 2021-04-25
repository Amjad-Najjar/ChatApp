import 'package:chatfirebase/Screens/Contects/Contects.dart';
import 'package:chatfirebase/Screens/HomeChats/Component/MassegeRow.dart';
import 'package:chatfirebase/Screens/HomeChats/Component/TopBar.dart';
import 'package:chatfirebase/Services/DataServer.dart';
import 'package:chatfirebase/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class HomeChats extends StatelessWidget {
    final DataServer db =Get.find<DataServer>();

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
        onPressed: ()async{
          var users=await db.getAllUsers();
          Get.to(()=>Contects(users:users,));},
        backgroundColor:Color(0xFF516091),
        child: Icon(Icons.chat_outlined,color: Colors.white),
      ),
    );
  }
}