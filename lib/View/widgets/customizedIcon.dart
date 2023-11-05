import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomizedIcon extends StatelessWidget {
  CustomizedIcon({super.key, required this.onTap, required this.icon});
  Function() onTap;
  IconData icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.black54, borderRadius: BorderRadius.circular(8)),
          child: Center(
            child: Icon(
              icon,
              color: Colors.grey,
            ),
          )),
    );
  }
}
