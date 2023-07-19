// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../Details/details_body.dart';

class SearchPage extends StatefulWidget {
  SearchPage({required this.prod});
  var prod;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<dynamic> display_list = [];
  void initState() {
    super.initState();
    display_list = widget.prod; // Access the 'widget' property in initState
  }

  void updateList(String value) {
    setState(() {
      widget.prod = display_list
          .where((element) => element['title']!
              .toLowerCase()
              .contains(value.toLowerCase()) as bool)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.home_outlined,
            size: 30,
          ),
          backgroundColor: Color(0xFFc9d6ff),
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                Color(0xFFc9d6ff),
                Color(0XFFe2e2e2),
              ])),
          child: Padding(
            padding: EdgeInsets.all(screenSize.height * 0.04),
            child: Column(
              children: [
                SizedBox(
                  height: screenSize.height * 0.05,
                ),
                TextField(
                  onChanged: (value) => updateList(value),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      hintText: "Search",
                      hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.2),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                      prefixIcon: Icon(
                        Icons.search_rounded,
                        color: Colors.black.withOpacity(0.2),
                      )),
                ),
                Expanded(
                  child: widget.prod.length == 0
                      ? Center(
                          child: Text(
                          "Sorry, No results found",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ))
                      : ListView.builder(
                          itemCount: widget.prod.length,
                          itemBuilder: (context, index) => MaterialButton(
                            child: ListTile(
                              title: Text(
                                widget.prod[index]['title'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              subtitle: Text(
                                widget.prod[index]['brand'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                              trailing: Text(
                                "\$${widget.prod[index]['price']}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.black.withOpacity(0.6)),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailsBody(
                                            prod: widget.prod[index],
                                          )));
                            },
                          ),
                        ),
                )
              ],
            ),
          ),
        ));
  }
}
