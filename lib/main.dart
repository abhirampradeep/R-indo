import 'dart:async';
import 'package:ar_indoor_nav/firebase_options.dart';
import 'package:ar_indoor_nav/pages/home.dart';
import 'package:ar_indoor_nav/pages/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(),
      home: Splasgscreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Splasgscreen extends StatefulWidget {
  @override
  _SplasgscreenState createState() => _SplasgscreenState();
}

class _SplasgscreenState extends State<Splasgscreen> {
  bool animate = false;

  @override
  void initState() {
    starAnimation();

    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: Colors.white, width: 4, style: BorderStyle.solid),
                  image: DecorationImage(
                      image: AssetImage(
                    'assets/images/image.jpeg',
                  ))),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              child: const Text(
                "R INDO",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future starAnimation() async {
    await Future.delayed(Duration(microseconds: 5000));
    setState(() {
      animate = true;
    });
    // await Future.delayed(Duration(microseconds: 5000));
    // Navigator.pushReplacement(
    //     context, MaterialPageRoute(builder: (context) => Login()));
  }
}
