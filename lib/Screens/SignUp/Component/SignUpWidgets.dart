
import 'package:flutter/material.dart';

class SignUpWidgets extends StatelessWidget {
 final Function onChangedTextFiled;
 final Function onSubmeted;
 final String text;
 final String buttonText;
 SignUpWidgets({this.text,this.buttonText,this.onSubmeted,this.onChangedTextFiled});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:18.0,vertical:8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          Text(
            "Please Enter",
            style: TextStyle(color: Color(0xff516091),fontSize: 20),
          ),
          Text(text,
              style: TextStyle(
                  color: Color(0xff516091),
                  fontSize: 25,
                  fontWeight: FontWeight.w900)),
                  Spacer(),
          Container(
            
            decoration: BoxDecoration(color: Colors.white60,borderRadius: BorderRadius.circular(12)),
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none),
                  onChanged: onChangedTextFiled,
            ),
          ),
          Spacer(),
          ElevatedButton(
            child: Center(child: Text(buttonText)),
            onPressed:onSubmeted,
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith(
                    (states) => Color(0xff516091)),
                shape:
                    MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)))),
          ),Spacer()
        ],
      ),
    );
  }
}
