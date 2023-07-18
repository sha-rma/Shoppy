import 'package:flutter/material.dart';

class MenuBody extends StatefulWidget {
  const MenuBody({super.key});

  @override
  State<MenuBody> createState() => _MenuBodyState();
}

class _MenuBodyState extends State<MenuBody> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
          child: Stack(
        children: [
          Container(
            height: screenSize.height,
            width: screenSize.width,
            color: Color(0xFFF4F4F4),
          ),
          Container(
            height: screenSize.height,
            width: screenSize.width * 0.75,
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
                        "Menu",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Text("Smartphones"),
                Text("Laptops"),
                Text("Fragrances"),
                Text("Skincare"),
                Text("Groceries"),
                Text("Home-Decoration"),
              ],
            ),
          )
        ],
      )),
    );
  }
}
