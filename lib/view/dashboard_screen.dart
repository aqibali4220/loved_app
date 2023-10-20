import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loved_app/view/iam_looking_screen.dart';
import 'package:loved_app/view/ihave_seen_screen.dart';
import '../utils/colors.dart';
import '../utils/images.dart';
import '../utils/size_config.dart';
import '../widgets/bottom_nav_bar.dart';
import 'iam_lost_screen.dart';


class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: getHeight(50),),

          GestureDetector(
            onTap: (){
              Get.to(()=>IAmLookingScreen());
            },
              child: Center(child: Image.asset(button_1,height: getHeight(100),width: getWidth(374),))),
          SizedBox(height: getHeight(12),),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: Text("If you have a lost loved one, create a post for them and your community will help you find them."),
          ),
          SizedBox(height: getHeight(50),),

          GestureDetector(

            onTap: (){
              Get.to(()=>IAmLostScreen());

            },
              child: Image.asset(button_2,height: getHeight(100),width: getWidth(374),)),
          SizedBox(height: getHeight(12),),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: Text("If you are a lost loved one looking for your family, create a post for yourself and your family will locate the post."),
          ),
          SizedBox(height: getHeight(50),),
          GestureDetector(


              onTap: (){
                Get.to(()=>IHaveSeenScreen());

              },
              child: Image.asset(button_3,height: getHeight(100),width: getWidth(374),)),
          SizedBox(height: getHeight(12),),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: Text("If you see a lost loved one, post them on the app with their consent for their family to find."),
          ),
          SizedBox(height: getHeight(50),),
        ],
      ),
      bottomNavigationBar: const BottomNavbar(),

    );
  }
}
