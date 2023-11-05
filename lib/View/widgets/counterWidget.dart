// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:new_app/constants/constants.dart';

class Counter extends StatelessWidget {
  Counter(
      {super.key,
      required this.counter,
      required this.decrease,
      required this.increase});
  int counter;
  Function() increase;
  Function() decrease;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: decrease,
            child: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: const Color(mainColor)),
              child: const Icon(
                Icons.remove,
                size: 10,
              ),
            ),
          ),
          Text(counter.toString()),
          GestureDetector(
            onTap: increase,
            child: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: const Color(mainColor)),
              child: const Icon(
                Icons.add,
                size: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
