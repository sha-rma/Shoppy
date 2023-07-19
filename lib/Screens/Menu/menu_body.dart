// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shoppy/Constants/auth.dart';
import 'package:shoppy/Screens/Cart/cart_body.dart';
import '../../Constants/fields.dart';

class MenuBody extends StatefulWidget {
  MenuBody({required this.prod});
  var prod;

  @override
  State<MenuBody> createState() => _MenuBodyState();
}

class _MenuBodyState extends State<MenuBody> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Drawer(
      child: SingleChildScrollView(
          child: Stack(
        children: [
          Container(
            height: screenSize.height,
            width: screenSize.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                  Color(0xFFc9d6ff),
                  Color(0XFFe2e2e2),
                ])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: screenSize.height * 0.05,
                      left: screenSize.width * 0.03),
                  child: Row(
                    children: [
                      SizedBox(
                        width: screenSize.width * 0.05,
                      ),
                      Text(
                        "Hello ",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      StreamBuilder<DocumentSnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('UserInfo')
                              .doc(FirebaseAuth.instance.currentUser!.uid)
                              .snapshots(),
                          builder: (context, snapshot) {
                            String userName;
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              userName = "";
                            } else {
                              Map<String, dynamic> nam =
                                  snapshot.data!.data() as Map<String, dynamic>;
                              userName = nam['displayName'];
                            }
                            return RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(
                                text: userName + ",",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                            );
                          }),
                      SizedBox(
                        width: screenSize.width * 0.3,
                      ),
                      IconButton(
                          onPressed: () {
                            logout(context);
                          },
                          icon: Icon(
                            Icons.logout_rounded,
                            size: 30,
                          ))
                    ],
                  ),
                ),
                Divider(thickness: 2, color: Colors.black.withOpacity(0.2)),
                reusableMenuButton(
                    screenSize: screenSize,
                    name: "Smartphones",
                    context: context,
                    prod: widget.prod),
                reusableMenuButton(
                    screenSize: screenSize,
                    name: "Laptops",
                    context: context,
                    prod: widget.prod),
                reusableMenuButton(
                    screenSize: screenSize,
                    name: "Fragrances",
                    context: context,
                    prod: widget.prod),
                reusableMenuButton(
                    screenSize: screenSize,
                    name: "Skincare",
                    context: context,
                    prod: widget.prod),
                reusableMenuButton(
                    screenSize: screenSize,
                    name: "Groceries",
                    context: context,
                    prod: widget.prod),
                reusableMenuButton(
                    screenSize: screenSize,
                    name: "Home-Decoration",
                    context: context,
                    prod: widget.prod),
                Container(
                  width: screenSize.width,
                  decoration: BoxDecoration(
                      color: Color(0xFFF4F4F4).withOpacity(0),
                      border: Border(
                          top: BorderSide.none,
                          left: BorderSide(
                              width: 2, color: Colors.black.withOpacity(0.2)),
                          right: BorderSide(
                              width: 2, color: Colors.black.withOpacity(0.2)),
                          bottom: BorderSide(
                              width: 2, color: Colors.black.withOpacity(0.2)))),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CartBody(
                                    prod: widget.prod,
                                  )));
                    },
                    child: Text(
                      "Go to Cart",
                      style: TextStyle(
                          color: Color(0xFF47037C),
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
