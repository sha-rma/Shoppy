import 'package:flutter/material.dart';
import 'package:shoppy/Screens/Details/details_body.dart';

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

Container reusableMenuButton({required screenSize, required name}) {
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
