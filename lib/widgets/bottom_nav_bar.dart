import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loved_app/utils/images.dart';
import 'package:loved_app/utils/size_config.dart';
import 'package:loved_app/view/drawer_screen.dart';

import '../utils/colors.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
      height: getHeight(80),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          stops: [0.1, 1.0],
          colors: [primaryColor.withOpacity(0.6), blue],
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: (){
              Get.to(()=>DrawerScreen());
            },
            child: Icon(
              Icons.view_headline_sharp,
              size: getHeight(30),
              color: white,
            ),
          ),
          Spacer(),
          PopupMenuButton<String>(
            icon: Icon(
              Icons.add,
              size: getHeight(30),
              color: white,
            ),
            // onSelected: choiceAction,
            itemBuilder: (BuildContext context) {
              return <String>[
                'home1'.tr,
                'home2'.tr,
                'home3'.tr,
              ].map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
          // SizedBox(
          //   width: getWidth(100),
          //   child: StatefulBuilder(
          //       builder: (BuildContext context, StateSetter setState) {
          //     return DropdownButton<String>(
          //       value: "0%",
          //       items: <String>[
          //         '0%',
          //         '20%',
          //         '40%',
          //         '60%',
          //         'Custom',
          //       ].map((String value) {
          //         return DropdownMenuItem<String>(
          //           value: value,
          //           child: Text(
          //             value,
          //           ),
          //         );
          //       }).toList(),
          //       underline: SizedBox(),
          //       borderRadius: BorderRadius.circular(5),
          //       isExpanded: true,
          //       icon: Icon(
          //         Icons.add,
          //         size: getHeight(30),
          //         color: white,
          //       ),
          //       onChanged: (String? newValue) {
          //         setState(() {});
          //       },
          //     );
          //   }),
          // ),
          SizedBox(
            width: getWidth(20),
          ),
          Icon(
            Icons.person,
            size: getHeight(30),
            color: white,
          ),
          SizedBox(
            width: getWidth(12),
          ),
          Image.asset(
            map_pin,
            height: getHeight(30),
            width: getWidth(30),
            color: white,
          ),
        ],
      ),
    );
  }
}
