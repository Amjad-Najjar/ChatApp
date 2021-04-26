import 'package:chatfirebase/Screens/ChatRoom/ChatRoom.dart';
import 'package:chatfirebase/Screens/SignUp/ProfileSetup.dart';
import 'package:chatfirebase/Screens/SignUp/SignUp.dart';
import 'package:chatfirebase/Screens/SignUpLogin.dart';
import 'package:chatfirebase/Services/auth.dart';
import 'package:chatfirebase/Services/DataServer.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'Screens/HomeChats/HomeChats.dart';



void main()async {
   WidgetsFlutterBinding.ensureInitialized(); 
  await Firebase.initializeApp();
  runApp(GetMaterialApp(
     initialBinding: BindingsBuilder(()async{
       Auth auth=Auth();
      Get.put<Auth>(auth,permanent: true);

       Get.put<DataServer>(DataServer(),permanent: true);

     }),
    home:SignUp())
    );
}
