import 'package:chatfirebase/Services/auth.dart';
import 'package:chatfirebase/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginSignup extends StatefulWidget {
  @override
  _LoginSignupState createState() => _LoginSignupState();
}

class _LoginSignupState extends State<LoginSignup> {
  String _currentEmail="amgad@test.com";
  String _currentPassword="testtest";
  final Auth _auth = Get.find<Auth>();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var type = "Sign In".obs;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title:Obx(()=> Text(type.value)),centerTitle: true,elevation: 0.0,actions: [
        RaisedButton.icon(
          onPressed: (){type.value= (type.value=="Sign In") ?"Sign Up":"Sign In";}, 
          icon: Icon(Icons.person), 
          label:Obx(()=>Text( type.value=="Sign In" ? "Sign Up":"Sign In")),
          shape:roundedShapeBorder,
          color:Colors.cyanAccent[700]
          ),
        ],),
        body: SafeArea(
      child: Form(
        key: _formkey,
        child:       
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Obx(()=>Text(type=="Sign In"?"Sign In":"Sign up", style: TextStyle(fontSize: 25,color: Colors.cyanAccent[700]))),
                Spacer(),
                TextFormField(
                  decoration: inputDecoration.copyWith(
                      hintText: "Enter you Email", labelText: "Email"),
                  onChanged: (val) =>  _currentEmail = val,
                  validator: (val) => val.isEmpty ? "Entet your Email" : null,
                ),
                SizedBox(
                  height: 50,
                ),
                TextFormField(
                  decoration: inputDecoration.copyWith(
                      hintText: "Enter your Password", labelText: "Password"),
                  onChanged: (val) =>  _currentPassword = val,
                  validator: (val) => val.length < 6
                      ? "Password Should be six digits long"
                      : null,
                  obscureText: true,
                ),
                SizedBox(
                  height: 70,
                ),
                                 Spacer(),

               RaisedButton(
              child: Center(
                    child:
                        Obx(()=>Text(type.value, style: TextStyle(color: Colors.white)))),
              onPressed: ()async {
                _formkey.currentState.validate();
               if(type=="Sign Up")
                await _auth.signUpWithEmail(_currentEmail, _currentPassword);
                else 
                await _auth.signInWithEmail(_currentEmail, _currentPassword);
              },
              shape: roundedShapeBorder,
              color: Colors.blueAccent,
            
                 ),
              ]),
            ),

            //  Spacer(),
           
          
        
      ),
    ));
  }
}
