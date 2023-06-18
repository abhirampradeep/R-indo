import 'package:ar_indoor_nav/pages/home.dart';
import 'package:ar_indoor_nav/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Thankyou extends StatefulWidget {
  const Thankyou({super.key});

  @override
  State<Thankyou> createState() => _ThankyouState();
}

class _ThankyouState extends State<Thankyou> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'File has been successfully sent',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Perform action for button 1
                    Navigator.pop(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                  },
                  child: Text('Upload Again?'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut().then((value) => {
                          Fluttertoast.showToast(msg: "logout Successul"),
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const loginScreen()))
                        });
                  },
                  child: Text('Logout'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
