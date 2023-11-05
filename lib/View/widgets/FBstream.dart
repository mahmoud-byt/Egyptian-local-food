import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:new_app/Models/sandwichModel.dart';
import 'package:new_app/View/screens/oneMeal.dart';
import 'package:new_app/View/widgets/cusomContainer.dart';

// ignore: must_be_immutable
class FBStream extends StatelessWidget {
  FBStream({super.key,  required this.stream, this.widget});
  Stream<QuerySnapshot<Map<String, dynamic>>> stream;
  Widget? widget;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: stream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Error in connnection'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container(
            padding: EdgeInsets.only(top: 20),
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 250,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10),
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return widget ??
                    CustomContainer(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OneMeal(meal: Meal.fromFB(data),),
                          )), 
                      text: data['name'],
                      image: data['image'],
                    );
              }).toList(),
            ),
          );
        });
  }
}
