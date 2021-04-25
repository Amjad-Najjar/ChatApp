import 'package:chatfirebase/model/USER.dart';
import 'package:chatfirebase/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Components/MessageCloud.dart';
import 'Components/ContectTile.dart';
import 'package:chatfirebase/Screens/ChatRoom/Components/SendingBox.dart';

class ChatRoom extends StatelessWidget {
  final USER user;
  ChatRoom({this.user});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Stack(
                    children:[ Column(children: [
              Padding(
                padding: const EdgeInsets.only(top:12.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: ContectTile(name: "Amgad Najjar", lastSeen: "away 10 M"),
                ),
              ),
              SizedBox(height: SizeConfig.blockSizeVertical*5,),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 78,
                child: ListView(children: [
                 
                  MessageCloud(isMe: false, message: "Hello"),
                  MessageCloud(isMe: true, message: "Hey Whatsapp"),
                ]),
              ),
              
            ]),
            Positioned(
               bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 0,
          right: 0,
                        child: Align(
                  alignment: Alignment.topCenter,
                  child: SendingBox(),
                ),
            )
            ]
          ),
        ),
      ),
    );
  }
}
