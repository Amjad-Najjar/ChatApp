

import 'package:flutter/material.dart';
import 'package:chatfirebase/shared/constant.dart';

class SendingBox extends StatelessWidget {
  final Function messageCallBack;
  final Function onSendCallBack;
  SendingBox({this.messageCallBack,this.onSendCallBack});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Container(
      width: double.infinity,
      //        height:SizeConfig.blockSizeVertical*10,

      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
         ElevatedButton(
          child: Center(child: Icon(Icons.emoji_emotions_outlined)),
          onPressed: () {},
          style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(primaryColor),

              shape: MaterialStateProperty.all<CircleBorder>(
                  CircleBorder(side: BorderSide(color: primaryColor)))),
        ),
        Container(
          width: SizeConfig.blockSizeHorizontal * 50,
          //  height:SizeConfig.blockSizeVertical*10,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey[300].withOpacity(0.2),
          ),
          child: TextField(
            onChanged: messageCallBack,
              decoration: InputDecoration(
            border: InputBorder.none,
            suffixIcon: InkWell(
              child: Icon(Icons.attach_file_outlined, color: Colors.grey),
            ),
          )),
        ),
        ElevatedButton(
          child: Center(child: Icon(Icons.send)),
          onPressed: onSendCallBack,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
              shape: MaterialStateProperty.all<CircleBorder>(
                  CircleBorder(side: BorderSide(color: primaryColor)))),
        ),
      ]),
    );
  }
}
