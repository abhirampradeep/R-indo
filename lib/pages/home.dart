import 'dart:io';

import 'package:ar_indoor_nav/models/UserModel.dart';
import 'package:ar_indoor_nav/models/BuildingModel.dart';
import 'package:ar_indoor_nav/pages/camera.dart';
import 'package:ar_indoor_nav/pages/details.dart';
import 'package:ar_indoor_nav/pages/login.dart';
import 'package:ar_indoor_nav/usable_widgets/usable_widget.dart';
import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _buildingnameTextController =
      TextEditingController();
  final TextEditingController _locationTextController = TextEditingController();
  final TextEditingController _emailcompanyTextController =
      TextEditingController();

  User? user = FirebaseAuth.instance.currentUser;
  UserModel userModel = UserModel();

  // final ImagePicker _picker = ImagePicker();
  final ImagePicker _picker = ImagePicker();

  String? imageUrl;

  String imageur = "";

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      userModel = UserModel.fromMap(value.data());

      setState(() {});
    });
  }

  XFile? file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut().then((value) {
                    Fluttertoast.showToast(msg: "logout Successful");
                    print("sign out sucessful");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const loginScreen()));
                  });
                },
                icon: const Icon(Icons.logout))
          ],
        ),
        backgroundColor: Colors.grey[900],
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Card(
                elevation: 10,
                shadowColor: Colors.grey[600],
                color: Colors.grey[900],
                shape: RoundedRectangleBorder(
                  side:
                      BorderSide(color: Colors.white.withOpacity(.7), width: 4),
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 110,
                        height: 110,
                        padding: const EdgeInsets.all(6),
                        margin: const EdgeInsets.all(10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Colors.white,
                                width: 1,
                                style: BorderStyle.solid),
                            image: const DecorationImage(
                                image: AssetImage(
                              'assets/images/person.png',
                            ))),
                      ),
                      const SizedBox(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${userModel.username}",
                            style: GoogleFonts.openSans(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          const Padding(padding: EdgeInsets.all(8)),
                          Text(
                            "${userModel.email}",
                            style: GoogleFonts.openSans(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                child: ElevatedButton(
                    onPressed: () {
                      _selectphoto(context);
                    },
                    child: Text(file == null ? "Upload file" : "selected")),
              ),
              const SizedBox(
                height: 15,
              ),
              usableTextfield("Building name", Icons.person, false,
                  _buildingnameTextController, (Value) => null),
              usableTextfield("Location", Icons.comment_bank, false,
                  _locationTextController, (Value) => null),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(40)),
                child: ElevatedButton(
                  onPressed: () async {
                    // sendDetails();
                    FirebaseFirestore firebaseFirestore =
                        FirebaseFirestore.instance;

                    User? adminuser = FirebaseAuth.instance.currentUser;

                    BuildingModel buildingModel = BuildingModel();

                    buildingModel.uid = adminuser!.uid;

                    buildingModel.buildingname =
                        _buildingnameTextController.text;
                    buildingModel.location = _locationTextController.text;

                    // storing thr file
                    String uniquefile =
                        DateTime.now().millisecondsSinceEpoch.toString();

                    //reference to storage root
                    Reference referenceRoot = FirebaseStorage.instance.ref();
                    Reference referenceDirImages =
                        referenceRoot.child("images");

                    //reference for the image to be stored
                    Reference referenceImageToUpload =
                        referenceDirImages.child(uniquefile);

                    //handle error
                    try {
                      //Store the file
                      await referenceImageToUpload.putFile(File(file!.path));
                      buildingModel.Fileurl =
                          await referenceImageToUpload.getDownloadURL();

                      firebaseFirestore
                          .collection("builddetails")
                          .doc(user?.uid)
                          .set(buildingModel.toMap());
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Thankyou()),
                      );
                    } catch (error) {}
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.resolveWith((states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.blue;
                        }
                        return Colors.green;
                      }),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)))),
                  child: const Text(
                    "SUBMIT",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Future _selectphoto(context) async {
    await showModalBottomSheet(
        context: context,
        builder: (context) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: Icon(Icons.camera),
                  title: Text("Camera"),
                  onTap: () async {
                    // Navigator.of(context).pop();
                    // _pickImage(ImageSource.camera);
                    ImagePicker imagePicker = ImagePicker();
                    XFile? file =
                        await imagePicker.pickImage(source: ImageSource.camera);
                    setState(() {
                      this.file = file;
                    });
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.filter),
                  title: Text("Pick a file"),
                  onTap: () async {
                    // _pickImage(ImageSource.gallery);
                    ImagePicker imagePicker = ImagePicker();
                    XFile? file = await imagePicker.pickImage(
                        source: ImageSource.gallery);

                    setState(() {
                      this.file = file;
                    });
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ));
  }
}
