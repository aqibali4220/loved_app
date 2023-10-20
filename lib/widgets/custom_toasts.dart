

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';

import '../utils/colors.dart';

class CustomToast {
  static failToast(
      {Color? bgcolor, Color? textColor, String? msg, len, gravity}) {
    return Fluttertoast.showToast(
      backgroundColor: bgcolor ?? red,
      textColor: textColor ?? white,
      msg: msg!,
      toastLength: len ?? Toast.LENGTH_LONG,
      gravity: gravity ?? ToastGravity.BOTTOM, // location// duration
    );
  }

  static successToast(
      {Color? bgcolor, Color? textColor, String? msg, len, gravity}) {
    return Fluttertoast.showToast(
      backgroundColor: bgcolor ?? green,
      textColor: textColor ?? white,
      msg: msg!,
      toastLength: len ?? Toast.LENGTH_LONG,
      gravity: gravity ?? ToastGravity.BOTTOM, // location// duration
    );
  }


}
