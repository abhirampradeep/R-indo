import 'package:ar_indoor_nav/models/user_model.dart';
import 'package:ar_indoor_nav/pages/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel userModel = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.userModel = UserModel.fromMap(value.data());

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut().then((value) {
                    Fluttertoast.showToast(msg: "logout Successful");
                    print("sign out sucessful");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const loginScreen()));
                  });
                },
                icon: Icon(Icons.logout))
          ],
        ),
        // smera@gmail.com
        backgroundColor: Colors.grey[900],
        body: Container(
          padding: EdgeInsets.all(20),
          child: Card(
            elevation: 10,
            shadowColor: Colors.grey[600],
            color: Colors.grey[900],
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.white.withOpacity(.7), width: 4),
              borderRadius: const BorderRadius.all(Radius.circular(30)),
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 110,
                    height: 110,
                    padding: const EdgeInsets.all(6),
                    margin: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: Colors.white,
                            width: 1,
                            style: BorderStyle.solid),
                        image: const DecorationImage(
                            image: AssetImage(
                          'assets/images/person.jpeg',
                        ))),
                  ),
                  SizedBox(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${userModel.username}",
                        style: GoogleFonts.openSans(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Padding(padding: EdgeInsets.all(8)),
                      Text(
                        "${userModel.email}",
                        style: GoogleFonts.openSans(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
