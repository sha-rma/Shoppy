// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:shoppy/Screens/Home/home_body.dart';
import '../../Constants/fields.dart';
import '../Cart/cart_body.dart';
import '../Menu/menu_body.dart';

class FilterPage extends StatefulWidget {
  FilterPage({required this.name, required this.products});
  var name;
  var products;

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomeBody()));
        },
        child: Icon(
          Icons.home_outlined,
          size: 30,
        ),
        backgroundColor: Color(0xFFc9d6ff),
      ),
      key: _scaffoldKey,
      drawer: MenuBody(
        prod: widget.products,
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
                                  builder: (context) => CartBody(
                                        prod: widget.products,
                                      )));
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
                          widget.name,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      for (int i = 0; i < widget.products.length; i++)
                        filterDisplay(
                            screenSize: screenSize,
                            prod: widget.products[i],
                            context: context,
                            name: widget.name),
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
