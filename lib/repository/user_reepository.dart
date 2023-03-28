import 'package:ar_indoor_nav/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//getxcontroller
class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _auth = FirebaseFirestore.instance;

  createUser(UserModel userModel) async {
    await _auth
        .collection("User")
        .add(userModel.toJson())
        .whenComplete(() => Get.snackbar(
              "Sucess",
              "Your account has been created sucessfully",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green.withOpacity(.1),
              colorText: Colors.green,
            ))
        .catchError((error, stackTrace) {
      Get.snackbar(
        "Error",
        "Something went wrong,Try again",
        backgroundColor: Colors.redAccent.withOpacity(.3),
        colorText: Colors.red,
      );
      print(error.toString());
    });
  }
}
