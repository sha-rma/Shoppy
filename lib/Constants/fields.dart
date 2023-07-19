import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shoppy/Screens/Details/details_body.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../Screens/Filter/filter_page.dart';

_showNotification({required msg}) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast
        .LENGTH_SHORT, // Duration for how long the popup should be visible (SHORT or LONG)
    gravity:
        ToastGravity.BOTTOM, // Location of the popup (TOP, CENTER, or BOTTOM)
    backgroundColor: Colors.black87, // Background color of the popup
    textColor: Colors.white, // Text color of the popup
    fontSize: 16.0, // Font size of the popup message
  );
}

Padding reusableContainer(
    {required screenSize, required prod, required context}) {
  return Padding(
    padding: EdgeInsets.only(
        left: screenSize.width * 0.0833,
        top: screenSize.width * 0.0833,
        right: screenSize.width * 0.0833),
    child: MaterialButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailsBody(
                      prod: prod,
                    )));
      },
      child: Container(
          width: screenSize.width * 0.833,
          height: screenSize.height * 0.21875,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xFF4F4F4),
              border: Border.all(color: Colors.black, width: 2)),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: screenSize.height * 0.02,
                ),
                Text(
                  prod['title'],
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.only(left: screenSize.width * 0.05),
                  child: Row(
                    children: [
                      Container(
                          height: screenSize.height * 0.15,
                          width: screenSize.width * 0.3,
                          child: Image.network(prod['thumbnail'])),
                      SizedBox(
                        width: screenSize.width * 0.05,
                      ),
                      Column(
                        children: [
                          Text(
                            "Id : " + prod['id'].toString(),
                            style: TextStyle(),
                          ),
                          Text("Price : " + prod['price'].toString()),
                          Text("Rating : " + prod['rating'].toString()),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    ),
  );
}

Padding reusableContainer2(
    {required screenSize, required prod, required context}) {
  return Padding(
    padding: EdgeInsets.only(
        left: screenSize.width * 0.0833,
        top: screenSize.width * 0.0833,
        right: screenSize.width * 0.0833),
    child: MaterialButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailsBody(
                      prod: prod,
                    )));
      },
      child: Container(
          width: screenSize.width * 0.833,
          height: screenSize.height * 0.21875,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xFF4F4F4),
              border: Border.all(color: Colors.black, width: 2)),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: screenSize.height * 0.02,
                ),
                Text(
                  prod['title'],
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.only(left: screenSize.width * 0.05),
                  child: Row(
                    children: [
                      Container(
                          height: screenSize.height * 0.15,
                          width: screenSize.width * 0.3,
                          child: Image.network(prod['thumbnail'])),
                      SizedBox(
                        width: screenSize.width * 0.05,
                      ),
                      Column(
                        children: [
                          Text("Price : " + prod['price'].toString()),
                          Text("Rating : " + prod['rating'].toString()),
                          IconButton(
                              onPressed: () async {
                                deletefromCart(prod: prod);
                                _showNotification(
                                    msg: "Item Removed from Cart");
                              },
                              icon: Icon(
                                Icons.delete,
                                size: 30,
                              ))
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    ),
  );
}

Container reusableMenuButton(
    {required screenSize, required name, required context, required prod}) {
  return Container(
    width: screenSize.width,
    decoration: BoxDecoration(
        color: Color(0xFFF4F4F4).withOpacity(0),
        border: Border(
            top: BorderSide.none,
            left: BorderSide(width: 2, color: Colors.black.withOpacity(0.2)),
            right: BorderSide(width: 2, color: Colors.black.withOpacity(0.2)),
            bottom:
                BorderSide(width: 2, color: Colors.black.withOpacity(0.2)))),
    child: TextButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FilterPage(
                      products: prod,
                      name: name,
                    )));
      },
      child: Text(
        name,
        style: TextStyle(
            color: Color(0xFF47037C),
            fontWeight: FontWeight.bold,
            fontSize: 16),
      ),
    ),
  );
}

Container priceFilter({required screenSize, required range, required label}) {
  return Container(
    width: screenSize.width,
    decoration: BoxDecoration(
        color: Color(0xFFF4F4F4).withOpacity(0),
        border: Border(
            top: BorderSide.none,
            left: BorderSide(width: 2, color: Colors.black.withOpacity(0.2)),
            right: BorderSide(width: 2, color: Colors.black.withOpacity(0.2)),
            bottom:
                BorderSide(width: 2, color: Colors.black.withOpacity(0.2)))),
    child: TextButton(
      onPressed: () {},
      child: Text(
        label,
        style: TextStyle(
            color: Color(0xFF47037C),
            fontWeight: FontWeight.bold,
            fontSize: 16),
      ),
    ),
  );
}

void addToCart({required prod}) {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? currentUser = auth.currentUser;
  if (currentUser != null) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference usersCollection = firestore.collection('UserInfo');
    usersCollection.doc(currentUser.uid).update({
      'cartList': FieldValue.arrayUnion([prod['id']]),
    });
    _showNotification(msg: "Item Added to Cart");
  }
}

void deletefromCart({required prod}) {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? currentUser = auth.currentUser;
  if (currentUser != null) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference usersCollection = firestore.collection('UserInfo');
    usersCollection.doc(currentUser.uid).update({
      'cartList': FieldValue.arrayRemove([prod['id']]),
    });
  }
}

Padding cartDisplay(
    {required screenSize, required prod, required index, required context}) {
  for (int i = 0; i < prod.length; i++) {
    if (prod[i]['id'] == index) {
      return reusableContainer2(
          context: context, screenSize: screenSize, prod: prod[i]);
    }
  }
  return Padding(
    padding: EdgeInsets.only(
        left: screenSize.width * 0.0833,
        top: screenSize.width * 0.0833,
        right: screenSize.width * 0.0833),
    child: Container(child: Text("Cart is Empty")),
  );
}

Padding catfilterDisplay(
    {required screenSize, required prod, required name, required context}) {
  var nam = name.toLowerCase();
  if (prod['category'] == nam) {
    return reusableContainer(
        context: context, screenSize: screenSize, prod: prod);
  }
  return Padding(
    padding: EdgeInsets.all(0),
    child: Container(),
  );
}
