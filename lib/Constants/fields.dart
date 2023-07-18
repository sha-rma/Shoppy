import 'package:flutter/material.dart';

Padding reusableContainer({required screenSize, required prod}) {
  final title = prod['title'];
  return Padding(
    padding: EdgeInsets.only(
        left: screenSize.width * 0.0833,
        top: screenSize.width * 0.0833,
        right: screenSize.width * 0.0833),
    child: Container(
      width: screenSize.width * 0.833,
      height: screenSize.height * 0.21875,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(0xFF4F4F4),
          border: Border.all(color: Colors.black, width: 2)),
      child: Text(title),
    ),
  );
}
