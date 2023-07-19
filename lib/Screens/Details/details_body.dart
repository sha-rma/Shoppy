// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../Constants/fields.dart';

class DetailsBody extends StatefulWidget {
  DetailsBody({required this.prod});
  var prod;
  @override
  State<DetailsBody> createState() => _DetailsBodyState();
}

class _DetailsBodyState extends State<DetailsBody> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          // height: 1000,
          width: screenSize.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                Color(0xFFc9d6ff),
                Color(0XFFe2e2e2),
              ])),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: screenSize.height * 0.0575,
            ),
            Padding(
              padding: EdgeInsets.only(left: screenSize.width * 0.0972),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios_rounded)),
            ),
            SizedBox(
              height: screenSize.height * 0.0375,
            ),
            Padding(
              padding: EdgeInsets.only(left: screenSize.width * 0.0972),
              child: Container(
                height: screenSize.height * 0.29375,
                width: screenSize.width * 0.7916,
                color: Colors.white,
                child: Image.network(
                  widget.prod['thumbnail'],
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.01875,
            ),
            Padding(
              padding: EdgeInsets.only(left: screenSize.width * 0.0972),
              child: Text(widget.prod['title'],
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: EdgeInsets.only(left: screenSize.width * 0.0972),
              child: Text("- " + widget.prod['brand'],
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 14,
                      fontWeight: FontWeight.normal)),
            ),
            SizedBox(
              height: screenSize.height * 0.01875,
            ),
            Divider(
              thickness: 2,
              color: Colors.black.withOpacity(0.5),
            ),
            SizedBox(
              height: screenSize.height * 0.01875,
            ),
            Padding(
              padding: EdgeInsets.only(left: screenSize.width * 0.0972),
              child: Row(
                children: [
                  Text(
                    "Price",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: screenSize.width * 0.0972,
                  right: screenSize.width * 0.0972),
              child: Text(widget.prod['price'].toString(),
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.75),
                      fontSize: 14,
                      fontWeight: FontWeight.normal)),
            ),
            SizedBox(
              height: screenSize.height * 0.0375,
            ),
            Padding(
              padding: EdgeInsets.only(left: screenSize.width * 0.0972),
              child: Row(
                children: [
                  Text(
                    "Rating",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: screenSize.width * 0.0972,
                  right: screenSize.width * 0.0972),
              child: Text(widget.prod['rating'].toString(),
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.75),
                      fontSize: 14,
                      fontWeight: FontWeight.normal)),
            ),
            SizedBox(
              height: screenSize.height * 0.0375,
            ),
            Padding(
              padding: EdgeInsets.only(left: screenSize.width * 0.0972),
              child: Row(
                children: [
                  Text(
                    "Discount %",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: screenSize.width * 0.0972,
                  right: screenSize.width * 0.0972),
              child: Text(widget.prod['discountPercentage'].toString(),
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.75),
                      fontSize: 14,
                      fontWeight: FontWeight.normal)),
            ),
            SizedBox(
              height: screenSize.height * 0.0375,
            ),
            Padding(
              padding: EdgeInsets.only(left: screenSize.width * 0.0972),
              child: Row(
                children: [
                  Text(
                    "Description",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.01875,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: screenSize.width * 0.0972,
                  right: screenSize.width * 0.0972),
              child: Text(widget.prod['description'],
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.75),
                      fontSize: 14,
                      fontWeight: FontWeight.normal)),
            ),
            SizedBox(
              height: screenSize.height * 0.0375,
            ),
            Center(
              child: MaterialButton(
                  onPressed: () {
                    addToCart(prod: widget.prod);
                  },
                  child: Container(
                    height: screenSize.height * 0.06875,
                    width: screenSize.width * 0.555,
                    decoration: BoxDecoration(
                        color: Color(0xFF47037C),
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                        child: Text(
                      "Add to Cart",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    )),
                  )),
            ),
            SizedBox(
              height: screenSize.height * 0.0375,
            ),
          ]),
        ),
      ),
    );
  }
}
