

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loved_app/utils/size_config.dart';

import '../data/permissions.dart';
import '../utils/colors.dart';
import '../utils/const.dart';

class GeneralController extends GetxController{

  final lovedBox = Hive.box(cLovedBoxKey);


  XFile? image;
  File? imageFile;

  int i = 1;
  var imagePath = "".obs;

  _getFromGallery(BuildContext context) async {
    PermissionOfPhotos().getFromGallery(context).then((value) async {
      if (value) {
        final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
        if (pickedFile != null) {
          print("Picked File: ${pickedFile.path}");
          var imagePath = pickedFile.path;
          // image = File(imagePath);
          // update();

          var imageName = imagePath.split("/").last;
          print("Image Name: $imageName");
          final dir1 = Directory.systemTemp;
          final targetPath1 = "${dir1.absolute.path}/dp$i.jpg";
          var compressedFile1 = await FlutterImageCompress.compressAndGetFile(
              imagePath, targetPath1,
              quality: 60);
          print("compressedFile File: ${compressedFile1!.path}");
          image = compressedFile1;
          //convert XFile to File
          imageFile = File(image!.path);
          imagePath = compressedFile1.path;
          i++;
          update();
        }
      } else {
        print(value);
      }
    });
  }

  /// Get from Camera
  _getFromCamera(BuildContext context) async {
    PermissionOfPhotos().getFromCamera(context).then((value) async {
      if (value) {
        final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
        if (pickedFile != null) {
          print("Picked File: ${pickedFile.path}");
          var imagePath = pickedFile.path;
          // image = File(imagePath);
          // update();

          var imageName = imagePath.split("/").last;
          print("Image Name: $imageName");
          final dir1 = Directory.systemTemp;
          final targetPath1 = dir1.absolute.path + "/dp${i}.jpg";
          var compressedFile1 = await FlutterImageCompress.compressAndGetFile(
              imagePath, targetPath1,
              quality: 60);
          print("compressedFile File: ${compressedFile1!.path}");
          image = compressedFile1;
          imageFile = File(image!.path);

          imagePath = compressedFile1.path;
          i++;
          update();
        }
      } else {
        print(value);
      }
    });
  }

  bottomSheet(BuildContext context) {
    Get.bottomSheet(Container(
      height: getHeight(150),
      color: white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  Icons.photo_camera,
                  size: getHeight(30),
                ),
                onPressed: () {
                  Get.back();
                  _getFromCamera(context);
                },
              ),
              Text("From Camera".tr)
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  Icons.photo,
                  size: getHeight(30),
                ),
                onPressed: () {
                  Get.back();
                  _getFromGallery(context);
                },
              ),
              Text("From Gallery".tr)
            ],
          ),
        ],
      ),
    ));
  }

}