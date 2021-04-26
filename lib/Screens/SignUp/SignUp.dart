import 'package:chatfirebase/Screens/SignUp/Component/BlurContainer.dart';
import 'package:chatfirebase/Screens/SignUp/Component/SignUpWidgets.dart';
import 'package:chatfirebase/Screens/SignUp/ProfileSetup.dart';
import 'package:chatfirebase/Services/auth.dart';
import 'package:flutter/material.dart';
import 'package:chatfirebase/shared/constant.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  Rx<bool> verfiyState = false.obs;

  @override
  Widget build(BuildContext context) {
    Auth auth = Get.find<Auth>();
    SizeConfig.init(context);

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
                        buttonText: "Next",
                        onChangedTextFiled: (val) {
                          email.text = val;
                        
                        },
                        onSubmeted: () {
                          if (email.text == "") email.text = "user7@user.com";

                          verfiyState.value = true;
                        },
                      )
                    :  SignUpWidgets(
                        text: "Password",
                        buttonText: "Next",
                        onChangedTextFiled: (val) {
                          password.text = val;
                        },
                        onSubmeted: () async {
                          if (password.text == "")
                            password.text = "user7@users";

                          print(email.text + " " + password.text);
                          await auth.signUpWithEmail(email.text, password.text);
                          Get.to(() => ProfileSetup());
                        },
                      )))));
  }
}
