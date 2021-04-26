import 'dart:io';

import 'package:chatfirebase/shared/constant.dart';
import 'package:flutter/material.dart';

class ImageWithStatus extends StatelessWidget {
 final double radius;
 final String image;
 //final Status state;
 ImageWithStatus({this.radius=35,this.image});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Container(
      width: SizeConfig.blockSizeHorizontal*20,
      child: Stack(
        children: [
          CircleAvatar(
            foregroundImage:image!=null?
                Image.network(image, fit: BoxFit.cover).image:null,
            backgroundColor:Colors.white70,
            child: image==null?Center(child:Icon(Icons.person,size:this.radius ,)):null,
            radius: radius,
          ),
          Positioned(
              bottom: SizeConfig.blockSizeVertical *1.5,
              right: SizeConfig.blockSizeHorizontal*2,
              child: Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(360),
                      color:Colors.lightGreenAccent[700])))
        ],
      ),
    );
  }
}
