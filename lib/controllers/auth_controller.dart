import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:loved_app/view/dashboard_screen.dart';
import 'package:loved_app/view/login_screen.dart';

import '../utils/const.dart';
import '../view/home_screen.dart';
import '../widgets/custom_toasts.dart';
import '../widgets/progress_bar.dart';
import 'general_controller.dart';

class AuthController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  loginUserFunc() {
    Get.dialog(ProgressBar(), barrierDismissible: false);

    try {
      FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then((value) {
        Get.find<GeneralController>().lovedBox.put(cUserSession, true);

        Get.to(() => DashBoardScreen());

        emailController.clear();

        passwordController.clear();
      },onError: (e){
            Get.back();
            CustomToast.failToast(msg: "$e");

      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        CustomToast.failToast(msg: "sign7".tr);
      } else if (e.code == 'wrong-password') {
        CustomToast.failToast(msg: "sign8".tr);
      }
      Get.back();
    } catch (e) {
      Get.back();
      print(e);
    }
  }

  createUserFunc() {
    Get.dialog(ProgressBar(), barrierDismissible: false);

    try {
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then((value) {
        Future.wait([
          addUserData(),
        ]);
        Get.find<GeneralController>().lovedBox.put(cUserSession, true);

        Get.to(() => DashBoardScreen());
        nameController.clear();
        emailController.clear();
        locationController.clear();
        phoneController.clear();
        passwordController.clear();
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        CustomToast.failToast(msg: "sign7".tr);
      } else if (e.code == 'wrong-password') {
        CustomToast.failToast(msg: "sign8".tr);
      }
      Get.back();
    } catch (e) {
      print(e);
    }
  }

  ///add user data to firebase
  Future addUserData() {
    return users.doc(FirebaseAuth.instance.currentUser!.uid).set({
      'user_name': nameController.text,
      'location': locationController.text,
      'email': emailController.text,
      'user_phone': phoneController.text,
    }).then((value) {
      // CustomToast.successToast(msg: "Data added Successfully!");

      ///optional
    }).catchError(
        (error) => CustomToast.failToast(msg: "Failed to add user: $error"));
  }


  checkSession() {
    if (Get.find<GeneralController>()
        .lovedBox
        .get(cUserSession, defaultValue: false) ==
        true) {
      Get.to(() =>  DashBoardScreen());
    } else {
      Get.offAll(() => LoginScreen());
    }
  }

}
