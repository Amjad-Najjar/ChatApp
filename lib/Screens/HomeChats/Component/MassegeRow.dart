import 'package:chatfirebase/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MassegeRow extends StatelessWidget {
  final String image;
  final String name;
  final String header;
  final int messagesCount;
  MassegeRow({this.image="images/11.jpg",this.name,this.header,this.messagesCount});
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:2.0,horizontal: 7.0),
      child: Container(
       decoration: BoxDecoration(color:Color(0xffADEBBE),borderRadius: BorderRadius.circular(20)),
        child: Slidable(
            actionPane: SlidableBehindActionPane(),
  actionExtentRatio: 0.10,
                child: Container(
            height: SizeConfig.blockSizeVertical*10,
            decoration: BoxDecoration(borderRadius:BorderRadius.circular(20),color: Colors.white,),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal*7),
              leading: CircleAvatar(foregroundImage: Image.asset(image,fit: BoxFit.cover).image,radius: 30,),
              title: Text(name,style: TextStyle(letterSpacing:1.3,color: Colors.grey[800] ,fontSize: 18,fontWeight:messagesCount!=0? FontWeight.w600:FontWeight.w500),),
              subtitle: Padding(
                padding: const EdgeInsets.only(top:8.0),
                child: Text(header,style: TextStyle(color:Colors.grey[600]),),
              ),
              trailing:messagesCount!=0? Container(
                width:SizeConfig.blockSizeHorizontal*5,height:SizeConfig.blockSizeHorizontal*5,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(360),color: Colors.greenAccent),
                child: Center(child: Text(messagesCount.toString(),textAlign: TextAlign.center,style: TextStyle(color:Colors.white,fontWeight: FontWeight.w700,)),
                )):null,
            ),
          ),
          secondaryActions: [
            SlideAction(
             
                child: IconButton(icon: Icon(Icons.pin_drop,color: Colors.white), onPressed:(){})
                ),
                 SlideAction(
             
                child: IconButton(icon: Icon(Icons.volume_mute,color: Colors.white), onPressed:(){})
                ),
                 SlideAction(
             
                child: IconButton(icon: Icon(Icons.delete,color: Colors.white), onPressed:(){})
                ),
          ],
     ),
      ),
    );
  }
}