import 'package:flutter/material.dart';

import '../../Constants/fields.dart';

class MenuBody extends StatefulWidget {
  const MenuBody({super.key});

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
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.close_outlined,
                            size: 30,
                          )),
                      SizedBox(
                        width: screenSize.width * 0.008,
                      ),
                      Text(
                        "Filters",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Divider(thickness: 2, color: Colors.black.withOpacity(0.2)),
                reusableMenuButton(screenSize: screenSize, name: "Smartphones"),
                reusableMenuButton(screenSize: screenSize, name: "Laptops"),
                reusableMenuButton(screenSize: screenSize, name: "Fragrances"),
                reusableMenuButton(screenSize: screenSize, name: "Skincare"),
                reusableMenuButton(screenSize: screenSize, name: "Groceries"),
                reusableMenuButton(
                    screenSize: screenSize, name: "Home-Decoration"),
                priceFilter(
                    screenSize: screenSize,
                    range: 500,
                    label: "Less than Rs.500"),
                priceFilter(
                    screenSize: screenSize,
                    range: 1000,
                    label: "Less than Rs.1000"),
                priceFilter(
                    screenSize: screenSize,
                    range: 1500,
                    label: "Less than Rs.1500"),
              ],
            ),
          )
        ],
      )),
    );
  }
}
