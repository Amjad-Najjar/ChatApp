import 'package:chatfirebase/Services/DataServer.dart';
import 'package:chatfirebase/model/USER.dart';
import 'package:chatfirebase/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'Components/MessageCloud.dart';
import 'Components/ContectTile.dart';
import 'package:chatfirebase/Screens/ChatRoom/Components/SendingBox.dart';

class ChatRoom extends StatelessWidget {
  final USER peerUser;
  final TextEditingController message=TextEditingController();
  final DataServer db=Get.find<DataServer>();
  ChatRoom({this.peerUser});
  @override
  Widget build(BuildContext context) {
    print(peerUser.name);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Stack(children: [
            Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: ContectTile(peerUser: peerUser),
                ),
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 5,
              ),
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
                child: SendingBox(
                  messageCallBack: (val)=>message.text=val,
                  onSendCallBack: ()async{
                    await db.sendMessage(peerUser);
                    print("Message Sended");
                  },
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
