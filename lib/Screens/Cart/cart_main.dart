import 'package:flutter/material.dart';
import 'cart_body.dart';

class CartMain extends StatefulWidget {
  const CartMain({super.key});

  @override
  State<CartMain> createState() => _CartMainState();
}

class _CartMainState extends State<CartMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CartBody(),
    );
  }
}
