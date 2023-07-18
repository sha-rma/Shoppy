import 'package:flutter/material.dart';
import 'package:shoppy/Screens/Menu/menu_body.dart';

class MenuMain extends StatefulWidget {
  const MenuMain({super.key});

  @override
  State<MenuMain> createState() => _MenuMainState();
}

class _MenuMainState extends State<MenuMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MenuBody(),
    );
  }
}
