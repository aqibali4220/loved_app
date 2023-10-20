import 'package:get/get.dart';
import 'package:loved_app/controllers/general_controller.dart';
import 'package:loved_app/controllers/home_controller.dart';

import '../controllers/auth_controller.dart';


Future  DataBindings() async{



  Get.lazyPut(() => AuthController(),fenix: true);
  Get.lazyPut(() => GeneralController(),fenix: true);
  Get.lazyPut(() => HomeController(),fenix: true);




}