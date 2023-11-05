// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  MyButton(
      {super.key,
      required this.text,
      required this.radius,
      required this.horizontalPadding,
      required this.verticalPadding,
      this.color,
      this.onTap});
  Color? color;
  String text;
  double radius;
  double horizontalPadding;
  double verticalPadding;
  Function()?onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding, vertical: verticalPadding),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(radius)),
        child: Text(
          text,
          style: const TextStyle(
              color: Colors.white, fontStyle: FontStyle.italic, fontSize: 18),
        ),
      ),
    );
  }
}
