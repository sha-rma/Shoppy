// ignore_for_file: body_might_complete_normally_catch_error, body_might_complete_normally_nullable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shoppy/Screens/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  _RegisterPageState();

  bool showProgress = false;

  final _formkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController confirmpassController =
      new TextEditingController();
  final TextEditingController displayName = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();

  bool _isObscure = true;
  bool _isObscure2 = true;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: screenSize.height,
          width: screenSize.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFFc9d6ff),
              Color(0XFFe2e2e2),
            ],
          )),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: screenSize.width * 0.0833),
                  child: Text(
                    "Sign Up,",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF47037C),
                        fontSize: 32),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: screenSize.width * 0.0833),
                  child: Text(
                    "Enter your details below",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.8),
                        fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: screenSize.height * 0.025,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(screenSize.width * 0.0833, 0,
                      screenSize.width * 0.0833, 0),
                  child: TextFormField(
                    controller: displayName,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Name',
                      hintStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black.withOpacity(0.2)),
                      enabled: true,
                      contentPadding: EdgeInsets.only(
                          left: screenSize.width * 0.038,
                          bottom: screenSize.height * 0.01,
                          top: screenSize.height * 0.01),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            new BorderSide(width: 2, color: Colors.black),
                        borderRadius: new BorderRadius.circular(15),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: new BorderSide(
                            width: 2, color: Colors.black.withOpacity(0.1)),
                        borderRadius: new BorderRadius.circular(15),
                      ),
                    ),
                    validator: (value) {
                      if (value!.length == 0) {
                        return "Name cannot be empty";
                      }
                    },
                    onChanged: (value) {},
                  ),
                ),
                SizedBox(
                  height: screenSize.height * 0.025,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(screenSize.width * 0.0833, 0,
                      screenSize.width * 0.0833, 0),
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Email',
                      hintStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black.withOpacity(0.2)),
                      enabled: true,
                      contentPadding: EdgeInsets.only(
                          left: screenSize.width * 0.038,
                          bottom: screenSize.height * 0.01,
                          top: screenSize.height * 0.01),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            new BorderSide(width: 2, color: Colors.black),
                        borderRadius: new BorderRadius.circular(15),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: new BorderSide(
                            width: 2, color: Colors.black.withOpacity(0.1)),
                        borderRadius: new BorderRadius.circular(15),
                      ),
                    ),
                    validator: (value) {
                      if (value!.length == 0) {
                        return "Email cannot be empty";
                      }
                      if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                          .hasMatch(value)) {
                        return ("Please enter a valid email");
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {},
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                SizedBox(
                  height: screenSize.height * 0.025,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(screenSize.width * 0.0833, 0,
                      screenSize.width * 0.0833, 0),
                  child: TextFormField(
                    obscureText: _isObscure,
                    controller: passwordController,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          icon: Icon(_isObscure
                              ? Icons.visibility_off
                              : Icons.visibility),
                          color: Colors.black.withOpacity(0.1),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          }),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Password',
                      hintStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black.withOpacity(0.2)),
                      enabled: true,
                      contentPadding: EdgeInsets.only(
                          left: screenSize.width * 0.038,
                          bottom: screenSize.height * 0.01,
                          top: screenSize.height * 0.02),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            new BorderSide(width: 2, color: Colors.black),
                        borderRadius: new BorderRadius.circular(15),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: new BorderSide(
                            width: 2, color: Colors.black.withOpacity(0.1)),
                        borderRadius: new BorderRadius.circular(15),
                      ),
                    ),
                    validator: (value) {
                      RegExp regex = new RegExp(r'^.{6,}$');
                      if (value!.isEmpty) {
                        return "Password cannot be empty";
                      }
                      if (!regex.hasMatch(value)) {
                        return ("please enter valid password min. 6 character");
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {},
                  ),
                ),
                SizedBox(
                  height: screenSize.height * 0.025,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(screenSize.width * 0.0833, 0,
                      screenSize.width * 0.0833, 0),
                  child: TextFormField(
                    obscureText: _isObscure2,
                    controller: confirmpassController,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          icon: Icon(_isObscure2
                              ? Icons.visibility_off
                              : Icons.visibility),
                          color: Colors.black.withOpacity(0.1),
                          onPressed: () {
                            setState(() {
                              _isObscure2 = !_isObscure2;
                            });
                          }),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Confirm Password',
                      hintStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black.withOpacity(0.2)),
                      enabled: true,
                      contentPadding: EdgeInsets.only(
                          left: screenSize.width * 0.038,
                          bottom: screenSize.height * 0.01,
                          top: screenSize.height * 0.02),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            new BorderSide(width: 2, color: Colors.black),
                        borderRadius: new BorderRadius.circular(15),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: new BorderSide(
                            width: 2, color: Colors.black.withOpacity(0.1)),
                        borderRadius: new BorderRadius.circular(15),
                      ),
                    ),
                    validator: (value) {
                      if (confirmpassController.text !=
                          passwordController.text) {
                        return "Password did not match";
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {},
                  ),
                ),
                SizedBox(
                  height: screenSize.height * 0.025,
                ),
                Center(
                  child: MaterialButton(
                    height: screenSize.height * 0.06875,
                    minWidth: screenSize.width * 0.833,
                    elevation: 5,
                    onPressed: () {
                      setState(() {
                        showProgress = true;
                      });
                      register(emailController.text, passwordController.text,
                          displayName.text);
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Text(
                      "Register",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    color: Color(0xFF47037C),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void register(String email, String password, String displayName) async {
    CircularProgressIndicator();
    if (_formkey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore(email, displayName)})
          .catchError((e) {});
    }
  }

  postDetailsToFirestore(String email, String displayName) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var user = _auth.currentUser;
    CollectionReference ref = firebaseFirestore.collection('UserInfo');
    ref.doc(user!.uid).set({
      'email': emailController.text,
      'displayName': displayName,
    });
    ref.doc(user.uid).set({'cartList': []}, SetOptions(merge: true));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }
}
