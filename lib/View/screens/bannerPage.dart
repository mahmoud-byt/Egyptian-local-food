import 'package:flutter/material.dart';
import 'package:new_app/View/screens/homepage.dart';
import 'package:new_app/View/widgets/cusomedButton.dart';

class BannerPage extends StatelessWidget {
  const BannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage("banner.jpg"))),
      child: Center(
          child: MyButton(
            onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),)),
              color: Colors.black38,
              text: "MAKE YOUR SANDWICH",
              radius: 5,
              horizontalPadding: 20,
              verticalPadding: 10)),
    ));
  }
}
