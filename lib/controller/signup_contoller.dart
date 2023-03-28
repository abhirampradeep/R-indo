import 'package:ar_indoor_nav/repository/authentication/authentication_respository.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final user = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  void registerUser(String email, String password) {
    AuthenticationRespository.instance
        .createUserWithEmailAndPassword(email, password);
  }
}
