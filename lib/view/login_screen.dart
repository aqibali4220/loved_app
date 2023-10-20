import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loved_app/view/sign_in_screen.dart';

import '../controllers/auth_controller.dart';
import '../utils/colors.dart';
import '../utils/images.dart';
import '../utils/size_config.dart';
import '../utils/text_styles.dart';
import '../widgets/custom_password_textfeild.dart';
import '../widgets/custom_textfield.dart';


class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});


  AuthController authController = Get.find();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        // backgroundColor: primaryColor,
        body: SingleChildScrollView(
          child: Container(
            height: getHeight(890),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                stops: [0.1, 1.0],
                colors: [primaryColor.withOpacity(0.6), blue],
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Form(
                key: authController.loginFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: getHeight(350),
                    ),

                    Text(
                      "sign2".tr.toString().toUpperCase(),
                      style: kSize18W700ColorWhite,
                    ),
                    SizedBox(
                      height: getHeight(12),
                    ),
                    GetBuilder<AuthController>(builder: (context) {
                      return CustomTextField(
                        backgroundColor: white,
                        height: getHeight(48),
                        text: "Enter email",
                        length: 30,
                        controller: authController.emailController,
                        keyboardType: TextInputType.emailAddress,
                        autovalidateMode:
                        authController.emailController.text.isNotEmpty
                            ? AutovalidateMode.onUserInteraction
                            : AutovalidateMode.disabled,
                        onChanged: (value) {
                          authController.update();
                        },
                        inputFormatters:
                        FilteringTextInputFormatter.deny(RegExp('[ ]')),
                      );
                    }),
                    SizedBox(
                      height: getHeight(12),
                    ),
                    Text(
                      "sign9".tr.toString().toUpperCase(),
                      style: kSize18W700ColorWhite,
                    ),
                    SizedBox(
                      height: getHeight(12),
                    ),
                    GetBuilder<AuthController>(builder: (context) {
                      return CustomPasswordTextField(
                        backgroundColor: white,
                        height: getHeight(48),
                        text: "********",
                        obscureText: true,
                        sufficon: 1,
                        length: 30,
                        controller: authController.passwordController,
                        keyboardType: TextInputType.emailAddress,
                        autovalidateMode:
                        authController.passwordController.text.isNotEmpty
                            ? AutovalidateMode.onUserInteraction
                            : AutovalidateMode.disabled,
                        onChanged: (value) {
                          authController.update();
                        },
                        inputFormatters:
                        FilteringTextInputFormatter.deny(RegExp('[ ]')),
                      );
                    }),
                    SizedBox(
                      height: getHeight(50),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (authController.loginFormKey.currentState!
                            .validate()) {
                          authController.loginUserFunc();
                        }
                      },
                      child: Center(
                        child: Text("sign9".tr.toString().toUpperCase(),
                            style: kSize28W700ColorWhite),
                      ),
                    ),
                    SizedBox(
                      height: getHeight(200),
                    ),

                    GestureDetector(
                      onTap: (){
                        Get.off(()=>SignInScreen());
                      },
                      child: RichText(text: TextSpan(text: "Don't have an account? ",style: kSize18W700ColorWhite,children: [
                        TextSpan(text: "Signup Now!",style: kSize18W700ColorWhite.copyWith(decoration: TextDecoration.underline))
                      ]),),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
