import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loved_app/widgets/progress_bar.dart';
import '../widgets/custom_toasts.dart';
import 'general_controller.dart';

class HomeController extends GetxController {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  TextEditingController controller5 = TextEditingController();
  TextEditingController controller6 = TextEditingController();
  TextEditingController controller7 = TextEditingController();

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  setPostPin() async {
    Get.dialog(ProgressBar(), barrierDismissible: false);
    DocumentReference docRef =
        users.doc(FirebaseAuth.instance.currentUser!.uid);

    Get.log("uid ${FirebaseAuth.instance.currentUser!.uid}");

    final docSnapshot = await docRef.get();

    docRef
        .collection("i am looking post")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
      "post_list": FieldValue.arrayUnion([
        {
          "name": controller1.text,
          "last known address": controller2.text,
          "last cell number": controller3.text,
          "last known school": controller4.text,
          "last known employer": controller5.text,
          "last seen": controller6.text,
          "identifying characteristics": controller7.text,
          "pic_person": "",
        }
      ]),
    }).whenComplete(() {
      cleanControllers();
      Get.back();
    }).catchError((error) {
      // Get.back();
      Get.log("Failed to add data: $error");

      CustomToast.failToast(msg: "Failed to add data: $error");
    });
  }

  setPostPinWithPic() async {
    // Create a reference to the file you want to upload.
    // final file = File('path/to/file');
    Get.dialog(ProgressBar(), barrierDismissible: false);

    final ref = FirebaseStorage.instance.ref('images/my_file.jpg');

    // Create a `UploadTask` object and start the upload.
    final task = ref.putFile(Get.find<GeneralController>().imageFile!);

    // Wait for the upload to complete.
    task.whenComplete(() async {
      // Get the download URL of the uploaded file.
      final downloadUrl = task.snapshot.ref.getDownloadURL();
      DocumentReference docRef =
          users.doc(FirebaseAuth.instance.currentUser!.uid);

      final docSnapshot = await docRef.get();
      // if (docSnapshot.exists) {
      // await deleteGunPostDataInFirebase();
      docRef
          .collection("i am looking post")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({
        "post_list": FieldValue.arrayUnion([
          {
            {
              "name": controller1.text,
              "last known address": controller2.text,
              "last cell number": controller3.text,
              "last known school": controller4.text,
              "last known employer": controller5.text,
              "last seen": controller6.text,
              "identifying characteristics": controller7.text,
              "pic_person": "$downloadUrl",
            }
          }
        ]),
      }).whenComplete(() {
        cleanControllers();
        Get.back();
      }).catchError((error) {
        // Get.back();
        Get.log("Failed to add data: $error");

        CustomToast.failToast(msg: "Failed to add data: $error");
      });
      // } else {
      //   docRef
      //       .collection("i am looking post")
      //       .doc(FirebaseAuth.instance.currentUser!.uid)
      //       .set({
      //     "name": "",
      //     "last known address": "",
      //     "last cell number": "",
      //     "last known school": "",
      //     "last known employer": "",
      //     "last seen": "",
      //     "identifying characteristics": "",
      //     "pic_person": "",
      //   }, SetOptions(merge: true)).whenComplete(() {
      //     cleanControllers();
      //     Get.back();
      //   }).catchError((error) {
      //     // Get.back();
      //     Get.log("Failed to add data: $error");
      //
      //     CustomToast.failToast(msg: "Failed to add data: $error");
      //   });
      // }
    });
  }

  deleteLookingPostDataInFirebase() async {
    CollectionReference collectionRef = users
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("i am looking post");

    QuerySnapshot querySnapshot = await collectionRef.get();
    List<DocumentSnapshot> documents = querySnapshot.docs;

    for (DocumentSnapshot document in documents) {
      await document.reference.delete();
    }
  }

  cleanControllers() {
    controller1.clear();
    controller2.clear();
    controller3.clear();
    controller4.clear();
    controller5.clear();
    controller6.clear();
    controller7.clear();
  }
}
