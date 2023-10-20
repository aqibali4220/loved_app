import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:loved_app/utils/colors.dart';
import 'package:loved_app/widgets/bottom_nav_bar.dart';


import '../utils/images.dart';
import '../utils/size_config.dart';
import '../utils/text_styles.dart';
import '../widgets/custom_textfield.dart';

class HomeScreen extends StatelessWidget {
   const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Image.asset(white_heart_logo),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              stops: [0.1,1.0],
              colors: [primaryColor.withOpacity(0.6), blue],
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
            ),
          ),

        )
        ,
        actions: [
          Icon(Icons.search,color: white,size: getHeight(30),),
          SizedBox(width: getWidth(20),),
          Icon(Icons.chat_rounded,color: white,size: getHeight(30),),
          SizedBox(width: getWidth(20),),

        ],
      ),
      body: Center(child: Image.asset(home_text,height: getHeight(200),width: getWidth(200),)),
      bottomNavigationBar: BottomNavbar(),

    );
  }
}


