import 'dart:io';

import 'package:chatfirebase/model/USER.dart';
import 'package:chatfirebase/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:chatfirebase/shared/Widgets/ImageWithStatus.dart';
class ContectTile extends StatelessWidget {
  final USER peerUser;
  ContectTile({this.peerUser});
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return  Container(
      child: Row(

        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

         ImageWithStatus(radius:35,),
       Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(peerUser.name,style:TextStyle(fontSize: 20,color:Colors.grey,fontWeight: FontWeight.w800,letterSpacing: 1.1)),
          Text("peerUser.lastSeen",style:TextStyle(color: Colors.grey)),
          ],
        ),
        Spacer(),
       
              IconButton(icon: Icon(Icons.search,color:Colors.grey,size:30), onPressed: (){}),
              IconButton(icon: Icon(Icons.more_vert ,color:Colors.grey,size:30), onPressed: (){}),
            
          
        
        
      
      ],),
       
    );
  }
}