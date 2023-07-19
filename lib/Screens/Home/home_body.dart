import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shoppy/Screens/Menu/menu_body.dart';
import '../../Constants/fields.dart';
import '../Search/search_bar.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  Map data = {};
  List<dynamic> products = [];
  Future fetchData() async {
    const url = "https://dummyjson.com/products";
    final uri = Uri.parse(url);
    http.Response response = await http.get(uri);
    data = json.decode(response.body);
    setState(() {
      products = data["products"];
    });
    debugPrint(products.toString());
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      drawer: MenuBody(
        prod: products,
      ),
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
              Padding(
                padding: EdgeInsets.only(
                    top: screenSize.height * 0.07625,
                    left: screenSize.width * 0.111),
                child: Row(
                  children: <Widget>[
                    IconButton(
                        onPressed: () {
                          _scaffoldKey.currentState?.openDrawer();
                        },
                        icon: Icon(
                          Icons.menu,
                          size: 30,
                        )),
                    SizedBox(
                      width: screenSize.width * 0.511,
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SearchPage(
                                        prod: products,
                                      )));
                        },
                        icon: Icon(
                          Icons.search_rounded,
                          size: 30,
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: screenSize.height * 0.04625,
              ),
              Container(
                  width: screenSize.width,
                  // height: screenSize.height * 0.8125,
                  decoration: BoxDecoration(
                      color: Color(0xFFF4F4F4),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: screenSize.height * 0.025,
                      ),
                      // TextField(
                      //   decoration: InputDecoration(
                      //       hintText: "Search",
                      //       prefixIcon: Icon(Icons.search_rounded),
                      //       border: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(30),
                      //       )),
                      // ),
                      // Center(
                      //   child: Container(
                      //     height: screenSize.height * 0.0626,
                      //     width: screenSize.width * 0.777,
                      //     decoration: BoxDecoration(
                      //         border: Border.all(
                      //             color: Colors.black.withOpacity(0.2),
                      //             width: 2),
                      //         borderRadius: BorderRadius.circular(50),
                      //         color: Color(0xFFF4F4F4)),
                      //     child: Row(
                      //       children: [
                      //         Padding(
                      //           padding: EdgeInsets.only(
                      //               left: screenSize.width * 0.04),
                      //           child: Icon(
                      //             Icons.search_rounded,
                      //             size: 30,
                      //             color: Colors.black.withOpacity(0.2),
                      //           ),
                      //         ),
                      //         Text(
                      //           "  Search",
                      //           style: TextStyle(
                      //               fontSize: 18,
                      //               color: Colors.black.withOpacity(0.2),
                      //               fontWeight: FontWeight.w500),
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: screenSize.height * 0.025,
                            left: screenSize.width * 0.111),
                        child: Text(
                          "Recommendations",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      for (int i = 0; i < products.length; i++)
                        reusableContainer(
                            screenSize: screenSize,
                            prod: products[i],
                            context: context),
                      SizedBox(
                        height: screenSize.height * 0.05,
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
