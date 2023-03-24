import 'package:ar_indoor_nav/pages/login.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
        child: const Text("logout"),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const loginScreen()));
        },
      )),
    );
  }
}
