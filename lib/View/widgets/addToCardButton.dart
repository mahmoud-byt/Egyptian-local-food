import 'package:flutter/material.dart';
import 'package:new_app/constants/constants.dart';

// ignore: must_be_immutable
class AddToCard extends StatelessWidget {
  AddToCard({super.key,required this.text, required this.onTap});
  Function() onTap;
  String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        alignment: Alignment.center,
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: const Color(mainColor), borderRadius: BorderRadius.circular(8)),
        child:  Text(text),
      ),
    );
  }
}
