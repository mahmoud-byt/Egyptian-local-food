import 'package:flutter/material.dart';
import 'package:new_app/Models/sandwichModel.dart';
import 'package:new_app/constants/constants.dart';

// ignore: must_be_immutable
class Choise extends StatelessWidget {
  Choise({super.key, required this.text, required this.extra,required this.onTap});
  String text;
  Extra extra;
  Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              color: extra.isChoosen == true
                  ? const Color(mainColor)
                  : Colors.black54,
              width: 1),
        ),
        child: Text(
          text,
          style: TextStyle(
              color: extra.isChoosen == true
                  ? const Color(mainColor)
                  : Colors.white),
        ),
      ),
    );
  }
}
