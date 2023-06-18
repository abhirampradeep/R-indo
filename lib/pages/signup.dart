import 'package:ar_indoor_nav/models/UserModel.dart';
import 'package:ar_indoor_nav/pages/home.dart';
import 'package:ar_indoor_nav/usable_widgets/usable_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class signUp extends StatefulWidget {
  const signUp({super.key});

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  @override
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _usernameTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();

  //for validation purpose
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;

    final updateuser = FirebaseAuth.instance.currentUser;
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: SingleChildScrollView(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Form(
              // autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
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
                          'assets/images/indoor.png',
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
                  usableTextfield("Enter Username", Icons.person, false,
                      _usernameTextController, (value) {
                    return null;
                  }),
                  usableTextfield(
                      "Enter Email", Icons.mail, false, _emailTextController,
                      (value) {
                    return null;
                  }),
                  usableTextfield("Enter password", Icons.lock, true,
                      _passwordTextController, (value) {
                    return null;
                  }),
                  const SizedBox(
                    height: 5,
                  ),
                  signInSignUpButton(context, false, () {
                    auth
                        .createUserWithEmailAndPassword(
                            email: _emailTextController.text,
                            password: _passwordTextController.text)
                        .then((value) {
                      FirebaseFirestore firebaseFirestore =
                          FirebaseFirestore.instance;
                      User? user = auth.currentUser;

                      UserModel userModel = UserModel();

                      //writing all data
                      userModel.email = user!.email;
                      userModel.uid = user.uid;

                      //taking the input from of username and password and storing it in userModel
                      userModel.username = _usernameTextController.text;
                      userModel.password = _passwordTextController.text;

                      firebaseFirestore
                          .collection("users")
                          .doc(user.uid)
                          .set(userModel.toMap());
                      Fluttertoast.showToast(
                          msg: "Account created Successfully");
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()),
                          (route) => false);
                    }).catchError((e) {
                      Fluttertoast.showToast(msg: e!.message);
                    });
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
