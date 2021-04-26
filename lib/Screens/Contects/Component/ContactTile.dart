import 'package:chatfirebase/Screens/ChatRoom/ChatRoom.dart';
import 'package:chatfirebase/model/USER.dart';
import 'package:chatfirebase/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ContactTile extends StatelessWidget {
  final USER user;
  ContactTile({this.user});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
          child: ListTile(leading: CircleAvatar(
       foregroundImage: Image.network(user.image).image,
radius: 30,
backgroundColor: Colors.grey.withOpacity(.9),
      ),
      title:Row(children: [SizedBox(width: SizeConfig.blockSizeHorizontal*8,),
      Text(user.name,style: TextStyle(fontSize: 20,color: Colors.grey,fontWeight:FontWeight.w600),),])
      ),
      onTap: (){Get.to(()=>ChatRoom(peerUser:user));},
    );
  }
}