import 'package:chatfirebase/Screens/Contects/Component/ContactTile.dart';
import 'package:chatfirebase/Services/DataServer.dart';
import 'package:chatfirebase/model/USER.dart';
import 'package:flutter/material.dart';
import'package:chatfirebase/shared/constant.dart';
import 'package:get/get.dart';
class Contects extends StatelessWidget {
  final List<USER> users;
  Contects({this.users});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contects",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor:primaryColor ,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:20.0,vertical: 8),
        child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.only(top:12.0),
                child: ContactTile(user:users[index]),
              ); 
            }
          ),
      ),
    );
  }
}