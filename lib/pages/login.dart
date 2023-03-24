import 'package:ar_indoor_nav/pages/home.dart';
import 'package:ar_indoor_nav/pages/signup.dart';
import 'package:ar_indoor_nav/usable_widgets/usable_widget.dart';
import 'package:flutter/material.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                logoWidget("assets/images/image.jpeg"),
                Container(
                  child: Text("R-INDO"),
                ),
                const SizedBox(
                  height: 30,
                ),
                usableTextfield(
                    "username", Icons.person, false, _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                usableTextfield(
                    "password", Icons.lock, true, _passwordTextController),
                const SizedBox(
                  height: 20,
                ),
                signInSignUpButton(context, true, () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                }),
                SignupOption(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row SignupOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have an Account?",
          style: TextStyle(color: Colors.black),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const signUp()));
          },
          child: const Text(
            "Sign Up",
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Image logoWidget(String imageName) {
    return Image.asset(
      imageName,
      fit: BoxFit.fitWidth,
      width: 150,
      height: 150,
    );
  }
}
