import 'package:ar_indoor_nav/pages/home.dart';
import 'package:ar_indoor_nav/usable_widgets/usable_widget.dart';
import 'package:flutter/material.dart';

class signUp extends StatefulWidget {
  const signUp({super.key});

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  @override
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _usernameTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                logoWidget("assets/images/image.jpeg"),
                Container(
                  child: Text("R-INDO"),
                ),
                const SizedBox(
                  height: 30,
                ),
                usableTextfield("Enter username", Icons.person, false,
                    _usernameTextController),
                const SizedBox(
                  height: 20,
                ),
                usableTextfield(
                    "Enter email", Icons.lock, false, _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                usableTextfield("Enter password", Icons.lock, true,
                    _passwordTextController),
                const SizedBox(
                  height: 20,
                ),
                signInSignUpButton(context, false, () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
