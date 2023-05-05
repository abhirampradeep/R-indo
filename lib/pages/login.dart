import 'package:ar_indoor_nav/pages/home.dart';
import 'package:ar_indoor_nav/pages/signup.dart';
import 'package:ar_indoor_nav/usable_widgets/usable_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();

  // void dispose() {
  //   _emailTextController.dispose();
  //   _passwordTextController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      // backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.all(20),
                    alignment: Alignment.center,

                    //decoraion of the image making it circle
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: Colors.white,
                            width: 4,
                            style: BorderStyle.solid),
                        image: const DecorationImage(
                            image: AssetImage(
                          'assets/images/image.jpeg',
                        ))),
                  ),
                  Container(
                    child: Text(
                      "AR-INDO",
                      style: GoogleFonts.openSans(
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  usableTextfield(
                      "Email ID", Icons.mail, false, _emailTextController,
                      (value) {
                    if (value == null || value.isEmpty) {
                      return 'please enter your email';
                    }
                  }),
                  const SizedBox(
                    height: 15,
                  ),
                  usableTextfield("Password ID", Icons.lock, true,
                      _passwordTextController, (value) {}),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  signInSignUpButton(context, true, () {
                    if (_formkey.currentState!.validate()) {
                      FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: _emailTextController.text.trim(),
                              password: _passwordTextController.text.trim())
                          .then((value) {
                        print("success");
                        Fluttertoast.showToast(msg: "login Succesful");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()));
                      }).onError((error, stackTrace) {
                        Fluttertoast.showToast(
                            msg: "unable to login,check email or password");
                        print("unable to login ${error.toString()}");
                      });
                    }
                    //ontap on login button
                  }),
                  SignupOption(),
                ],
              ),
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
          style: TextStyle(color: Colors.white),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const signUp()));
          },
          child: const Text(
            "Sign Up",
            style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
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
