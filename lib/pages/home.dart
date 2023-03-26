import 'package:ar_indoor_nav/pages/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CollectionReference users = FirebaseFirestore.instance.collection('User');
  @override
  Widget build(BuildContext context) {
    // final Users = FirebaseAuth.instance.currentUser;
    users.get();
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut().then((value) {
                    print("sign out sucessful");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const loginScreen()));
                  });
                },
                icon: Icon(Icons.door_back_door))
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: Colors.white,
                            width: 4,
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
                        'ajdkj',
                        style: GoogleFonts.openSans(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Padding(padding: EdgeInsets.all(7)),
                      Text(
                        'sdjda',
                        style: GoogleFonts.openSans(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
