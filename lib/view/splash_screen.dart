import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loved_app/controllers/auth_controller.dart';
import 'package:loved_app/controllers/general_controller.dart';
import 'package:loved_app/view/home_screen.dart';
import 'package:loved_app/view/login_screen.dart';

import '../utils/colors.dart';
import '../utils/images.dart';
import '../utils/size_config.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () {
      Get.find<AuthController>().checkSession();
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      // backgroundColor: primaryColor,
      body: Center(
        child: Image.asset(
          app_logo,
          width: getWidth(200),
          height: getHeight(200),
        ),
      ),
    );
  }
}
