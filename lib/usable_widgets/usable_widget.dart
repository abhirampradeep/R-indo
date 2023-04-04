import 'package:flutter/material.dart';

Image logoWidget(String imageName) {
  return Image.asset(
    imageName,
    fit: BoxFit.fill,
    width: 150,
    height: 150,
  );
}

TextFormField usableTextfield(String text, IconData icon, bool isPasswordtype,
    TextEditingController controller) {
  return TextFormField(
    controller: controller,
    obscureText: isPasswordtype,
    enableSuggestions: !isPasswordtype,
    autocorrect: !isPasswordtype,
    cursorColor: Colors.white,
    style: TextStyle(color: Colors.white),
    decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(15),
        ),
        helperText: '',
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(15),
        ),
        focusColor: Colors.white,
        isDense: true,
        contentPadding: EdgeInsets.only(top: 15),
        prefixIcon: Icon(
          icon,
          color: Colors.white,
        ),
        hintText: text,
        hintStyle: TextStyle(color: Colors.white)),
    keyboardType: isPasswordtype
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

Container signInSignUpButton(
    BuildContext context, bool isLogin, Function() onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.blue;
            }
            return Colors.green;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))),
      child: Text(
        isLogin ? "LOG IN" : "SIGN UP",
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
      ),
    ),
  );
}



  // Container(
  //                 child: TextFormField(
  //                   validator: (value) {
  //                     if (value == null || value.isEmpty) {
  //                       return "enter email address";
  //                     } else
  //                       return null;
  //                   },
  //                   controller: _emailTextController,
  //                   keyboardType: TextInputType.emailAddress,
  //                   style: TextStyle(color: Colors.white),
  //                   decoration: InputDecoration(
  //                       focusedBorder: OutlineInputBorder(
  //                         borderSide: BorderSide(color: Colors.white, width: 2),
  //                         borderRadius: BorderRadius.circular(15),
  //                       ),
  //                       enabledBorder: OutlineInputBorder(
  //                         borderSide: BorderSide(color: Colors.white, width: 2),
  //                         borderRadius: BorderRadius.circular(15),
  //                       ),
  //                       helperText: '',
  //                       border: OutlineInputBorder(
  //                         borderSide: BorderSide(color: Colors.white, width: 2),
  //                         borderRadius: BorderRadius.circular(15),
  //                       ),
  //                       focusColor: Colors.white,
  //                       isDense: true,
  //                       contentPadding: EdgeInsets.only(top: 15),
  //                       prefixIcon: Icon(
  //                         Icons.email,
  //                         color: Colors.white,
  //                       ),
  //                       hintText: 'Enter your email',
  //                       hintStyle: TextStyle(color: Colors.white)),
  //                 ),
  //               ),