import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shoppy/Screens/Menu/menu_body.dart';
import '../../Constants/fields.dart';
import '../Cart/cart_body.dart';

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
      drawer: MenuBody(),
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
                                  builder: (context) => const CartBody()));
                        },
                        icon: Icon(
                          Icons.shopping_cart_outlined,
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
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
