import 'dart:io';

import 'package:chatfirebase/Screens/HomeChats/HomeChats.dart';
import 'package:chatfirebase/Services/MediaService.dart';
import 'package:chatfirebase/Services/auth.dart';
import 'package:flutter/material.dart';
import 'package:chatfirebase/Screens/SignUp/Component/BlurContainer.dart';
import 'package:chatfirebase/shared/constant.dart';
import 'package:get/get.dart';

class ProfileSetup extends StatelessWidget {
  Rx<String> name=''.obs;
  Rx<File> image;   
  Rx< MediaService> media=MediaService().obs;
  final Auth  auth=Get.find<Auth>();

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/profilSetup.jpg"),
                fit: BoxFit.cover)),
        child:Obx(()=> SetUpProfileWidgets(
       //   image:media.value.image,
          setNameCallBack: (val){name.value=val;},
          onSubmeted: (){
            print("ss");
           //f print(name.value+"ss");
         //   print(media.value.image.path);
         //   await auth.updateUserProfile("remas","st");
           // Get.to(()=>HomeChats());
            },
          changeImageCallBack:()async{ await media.value.getImageFromGallery();},
        )),
      ),
    );
  }
}

class SetUpProfileWidgets extends StatelessWidget {
  final Function changeImageCallBack;
  final Function setNameCallBack;
  final Function onSubmeted;
  final File image;
  SetUpProfileWidgets({this.changeImageCallBack,this.setNameCallBack,this.image,this.onSubmeted});
  @override
  Widget build(BuildContext context) {
    
    return Stack(children: [
      BlurContainer(
          blurStrength: 2,
          width: SizeConfig.blockSizeHorizontal * 70,
          height: SizeConfig.blockSizeVertical * 34,
          posY: SizeConfig.blockSizeVertical * 33,
          posX: SizeConfig.blockSizeHorizontal * 15,
          child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(
                    flex: 3,
                  ),
                  TextButton.icon(
                      onPressed: changeImageCallBack,
                      icon: Icon(Icons.image_outlined,
                          size: 16, color: primaryColor),
                      label: Text("Edit Display Image",
                          style: TextStyle(
                              color: primaryColor, fontSize: 16))),
                  Spacer(),
                  Container(
                      decoration: BoxDecoration(
                        color: Colors.white60,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 8),
                          hintText: "Enter Display Name",
                          hintStyle: TextStyle(
                              color: Colors.grey, letterSpacing: 1.1),
                          border: InputBorder.none,
                        ),
                        onSubmitted: setNameCallBack,
                      )),
                  Spacer(flex: 2),
                  ElevatedButton(
                      child: Center(
                          child: Text("All Set!",
                              style: TextStyle(color: Colors.white,fontSize: 18))),
                      onPressed: onSubmeted,
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              primaryColor),
                          shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(18))))),
                  Spacer(flex: 2),
                ],
              ))),
      Positioned(
          top: SizeConfig.blockSizeVertical * 25,
          left: SizeConfig.blockSizeHorizontal * 50 - 45,
          child: InkWell(
                      child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 8, color: Colors.white70, spreadRadius: 15)
                ],
              ),
              child: CircleAvatar(
                radius: 45,
                foregroundImage:image !=null? Image.file(image ).image:null,
                backgroundColor: Colors.white70,
                child: image==null?Center(child:Icon(Icons.person_outline,size:40,color:Colors.grey)):null,
              ),
            ),
            onTap: changeImageCallBack,
          ))
    ]);
  }
}
