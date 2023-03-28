import 'package:ar_indoor_nav/controller/signup_contoller.dart';
import 'package:ar_indoor_nav/models/user_model.dart';
import 'package:ar_indoor_nav/pages/home.dart';
import 'package:ar_indoor_nav/usable_widgets/usable_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class signUp extends StatefulWidget {
  const signUp({super.key});

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  @override
  // TextEditingController _passwordTextController = TextEditingController();
  // TextEditingController _usernameTextController = TextEditingController();
  // TextEditingController _emailTextController = TextEditingController();

  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: SingleChildScrollView(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Form(
              // autovalidateMode: AutovalidateMode.onUserInteraction,
              // key: _formKey,
              child: Column(
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
                      "R-INDO",
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
                      "Enter Username", Icons.person, false, controller.user),
                  usableTextfield(
                      "Enter Email", Icons.mail, false, controller.email),
                  usableTextfield(
                      "Enter password", Icons.lock, true, controller.password),
                  const SizedBox(
                    height: 5,
                  ),
                  signInSignUpButton(context, false, () {
                    // if (_formKey.currentState!.validate()) {
                    final user = UserModel(
                        user: controller.user.text.trim(),
                        email: controller.email.text.trim(),
                        password: controller.password.text.trim());
                    SignUpController.instance.registerUser(
                        controller.email.text.trim(),
                        controller.password.text.trim());
                    // }

                    // FirebaseAuth.instance
                    //     .createUserWithEmailAndPassword(
                    //         email: controller.email.text.trim(),
                    //         password: controller.password.text.trim())
                    //     .then((value) {
                    //   print("successful");
                    //   Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) => const HomeScreen()));
                    // }).onError((error, stackTrace) {
                    //   print("error ${error.toString()}");
                    // });
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
