import 'dart:async';
import 'package:ar_indoor_nav/pages/login.dart';
import 'package:flutter/material.dart';

void main() {
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
            MaterialPageRoute(builder: (context) => const loginScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              height: animate ? 100 : 100,
              width: animate ? 100 : 100,
              duration: const Duration(microseconds: 5600),
              child: const FlutterLogo(),
            ),
            AnimatedContainer(
              duration: const Duration(microseconds: 5600),
              child: const Text(
                "AR INDO",
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
