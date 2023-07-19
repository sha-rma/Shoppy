// ignore_for_file: must_be_immutable
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../Constants/fields.dart';

class CartBody extends StatefulWidget {
  CartBody({required this.prod});
  var prod;

  @override
  State<CartBody> createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          // height: screenSize.height,
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
            children: <Widget>[
              Container(
                height: screenSize.height * 0.25,
                width: screenSize.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_cart_checkout_outlined,
                      size: 50,
                    ),
                    SizedBox(
                      height: screenSize.height * 0.01,
                    ),
                    Text(
                      "Check out to complete your",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          color: Color(0xFF454545)),
                    ),
                    Text(
                      "Order",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          color: Color(0xFF454545)),
                    )
                  ],
                ),
              ),
              Container(
                // height: 600,
                width: screenSize.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50)),
                    color: Color(0xFFF4F4F4)),
                child: Column(
                  children: [
                    StreamBuilder<DocumentSnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('UserInfo')
                            .doc(FirebaseAuth.instance.currentUser!.uid)
                            .snapshots(),
                        builder: ((context, snapshot) {
                          List cart = [];
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            cart = [];
                          } else {
                            Map<String, dynamic> user =
                                snapshot.data!.data() as Map<String, dynamic>;
                            if (user['cartList'] != null) {
                              cart = user['cartList'];
                            }
                          }
                          return Container(
                              // height: MediaQuery.of(context).size.height,
                              child: Column(
                            children: [
                              for (int i = 0; i < cart.length; i++)
                                cartDisplay(
                                    screenSize: screenSize,
                                    prod: widget.prod,
                                    index: cart[i],
                                    context: context),
                              SizedBox(height: screenSize.height * 0.033)
                            ],
                          ));
                        }))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
