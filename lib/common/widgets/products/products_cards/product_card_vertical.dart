import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductCardVertical extends StatefulWidget {
  const ProductCardVertical({super.key});

  @override
  State<ProductCardVertical> createState() => _ProductCardVerticalState();
}

class _ProductCardVerticalState extends State<ProductCardVertical> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Container(
         width:180,
         padding: EdgeInsets.all(1),
         decoration: BoxDecoration(

         ),
       ),
    );
  }
}
