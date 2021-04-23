import 'package:chatfirebase/Screens/HomeChats/HomeChats.dart';
import 'package:chatfirebase/Screens/SignUpLogin.dart';
import 'package:chatfirebase/Services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Wrapper extends GetWidget {
  @override
  Widget build(BuildContext context) {
      // return Obx((){
      //   print(Get.find<Auth>().myStream);
      //   if (Get.find<Auth>().myStream?.uid != null) {
          return HomeChats();
        // } else {
        //   return LoginSignup();
        // }});
      
    
    
  }
}