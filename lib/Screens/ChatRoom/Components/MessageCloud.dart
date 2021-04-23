import 'package:chatfirebase/shared/constant.dart';
import 'package:flutter/material.dart';
class MessageCloud extends StatelessWidget {
  final bool isMe;
  final String message;
  MessageCloud({this.isMe,this.message});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return  Align(
      alignment: isMe ?Alignment.centerRight:Alignment.centerLeft,
          child: Container(
          
          padding: EdgeInsets.all(12),
          constraints: BoxConstraints(
          /*  maxHeight: SizeConfig.blockSizeVertical*80,
           // minHeight: SizeConfig.blockSizeVertical*5,
            maxWidth: 50,
            //minWidth: 5,
            ),
*/
          ),

          decoration: BoxDecoration(
            borderRadius:BorderRadius.circular(16),
            color:isMe?Color(0xffEEF3AD):Color(0xffADEBBE),
          ),
          child:Text(message,style: TextStyle(color: Colors.grey,fontSize:16),)
        
      ),
    );
  }
}