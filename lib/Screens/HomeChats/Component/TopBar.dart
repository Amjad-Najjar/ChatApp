import 'package:chatfirebase/shared/constant.dart';
import 'package:chatfirebase/shared/Widgets/ImageWithStatus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical:SizeConfig.blockSizeVertical*3,horizontal: SizeConfig.blockSizeHorizontal*2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ImageWithStatus(),
          SizedBox(width: SizeConfig.blockSizeHorizontal * 10),
          Container(
            width: SizeConfig.blockSizeHorizontal * 35,
            height: SizeConfig.blockSizeVertical * 4,
            decoration: BoxDecoration(
                color: Colors.grey[300].withOpacity(0.2),
                borderRadius: BorderRadius.circular(14)),
            child: Align(
              alignment: Alignment.center,
              child: TextField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(12)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(12)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(12)),
                    contentPadding: EdgeInsets.zero,
                    prefixIcon: Icon(Icons.search, color: Colors.grey[400]),
                    hintText: "Search",
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                    )),
              ),
            ),
          ),
          Icon(Icons.more_vert,color:Colors.grey[400])
        ],
      ),
    );
  }
}

