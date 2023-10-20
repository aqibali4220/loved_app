import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:loved_app/utils/const.dart';
import 'package:loved_app/utils/localization_page.dart';
import 'package:loved_app/view/dashboard_screen.dart';
import 'package:loved_app/view/home_screen.dart';
import 'package:loved_app/view/login_screen.dart';
import 'package:loved_app/view/iam_looking_screen.dart';
import 'package:loved_app/view/sign_in_screen.dart';
import 'package:loved_app/view/splash_screen.dart';


import 'data/data_bindings.dart';

 main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  DataBindings();
  await Hive.initFlutter();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await Hive.openBox(cLovedBoxKey);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        locale: LocalizationService.locale,
        fallbackLocale: LocalizationService.fallbackLocale,
        translations: LocalizationService(),
        debugShowCheckedModeBanner: false,
        title: 'Find You Loved One\'s',
        getPages: [
          GetPage(
            name: "/",
            page: () =>  SplashScreen(),
          )
        ]);
  }
}
