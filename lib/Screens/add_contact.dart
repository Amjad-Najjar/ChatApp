import 'package:chatfirebase/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class AddContact extends StatelessWidget {
  final _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    String _currentEmail;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
            key:_formKey,
            child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 150),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Add new Contact ",style: TextStyle(fontSize: 30,color: Colors.cyanAccent[600]),),
             //   SizedBox(height:20),
               Spacer(),
                TextFormField(
                  decoration:inputDecoration,
                  validator: (val)=>val.length <4 ? "Email is not valid" :null,
                  onSaved: (val)=>_currentEmail,
                ),
                Spacer(),
                RaisedButton(
                  child: Text("ADD",style:TextStyle(color: Colors.white)),
                  shape: roundedShapeBorder,
                  color: Colors.blueAccent[300],
                  onPressed: (){},
                  ),
              ],
            ),
          ),
        )
        
        ),
    );
  }
}