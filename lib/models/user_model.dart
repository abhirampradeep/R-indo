import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String? uid;
  String? username;
  String? email;
  String? password;

  UserModel({this.uid, this.username, this.email, this.password});

  //recieving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      username: map['username'],
      password: map['password'],
    );
  }

  //sending data to server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'username': username,
      'password': password,
    };
  }
}
