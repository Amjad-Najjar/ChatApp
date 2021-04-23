import 'package:chatfirebase/Screens/SignUp/Component/BlurContainer.dart';
import 'package:chatfirebase/Screens/SignUp/Component/SignUpWidgets.dart';
import 'package:chatfirebase/Screens/SignUp/ProfileSetup.dart';
import 'package:chatfirebase/Services/auth.dart';
import 'package:flutter/material.dart';
import 'package:chatfirebase/shared/constant.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  Rx<String> email = "".obs;
  Rx<String> password = "".obs;
  @override
  Widget build(BuildContext context) {
    Auth auth = Get.find<Auth>();
    SizeConfig.init(context);
    Rx<bool> verfiyState = false.obs;

    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/backGround.jpg"),
                    fit: BoxFit.cover)),
            child: BlurContainer(
                blurStrength: 2,
                width: SizeConfig.blockSizeHorizontal * 70,
                height: SizeConfig.blockSizeVertical * 40,
                posY: SizeConfig.blockSizeVertical * 30,
                posX: SizeConfig.blockSizeHorizontal * 15,
                child: Obx(() => !verfiyState.value
                    ? SignUpWidgets(
                        text: "Your Email",
                        buttonText: "Get OTP",
                        onChangedTextFiled: (val) {
                          return email.value = val;
                        },
                        onSubmeted: () {
                          verfiyState.value = true;
                        },
                      )
                    : SignUpWidgets(
                        text: "Your 6 Digits OTP",
                        buttonText: "Verrify",
                        onChangedTextFiled: (val) {
                          password.value = val;
                        },
                        onSubmeted: () async {
                          await auth.signUpWithEmail(
                              email.value, password.value);
                              Get.to(()=>ProfileSetup());
                        },
                      )))));
  }
}
