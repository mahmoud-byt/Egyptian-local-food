import 'package:flutter/material.dart';
import 'package:new_app/View/screens/ordersPage.dart';
import 'package:new_app/View/widgets/FBstream.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:new_app/View/widgets/tabBarIndicator.dart';
import 'package:new_app/constants/constants.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  final Stream<QuerySnapshot<Map<String, dynamic>>> _sandwichStream =
      FirebaseFirestore.instance.collection('sandwiches').snapshots();

  final Stream<QuerySnapshot<Map<String, dynamic>>> _mealStream =
      FirebaseFirestore.instance.collection('meal').snapshots();

  final Stream<QuerySnapshot<Map<String, dynamic>>> _extraStream =
      FirebaseFirestore.instance.collection('extras').snapshots();
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: const Color(mainColor),
            currentIndex: _selectedIndex,
            onTap: (value) {
              setState(() {
                _selectedIndex = value;
              });
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
              BottomNavigationBarItem(
                label: "",
                icon: Icon(Icons.shopping_bag),
              ),
              BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "")
            ]),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35.0, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Orders(),
                            ));
                      },
                      icon: const Icon(
                        Icons.shopping_bag,
                        color: Colors.grey,
                      ),
                    ),
                    const Icon(
                      Icons.favorite,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 35.0),
                child: Text(
                  "Find the best",
                  style: TextStyle(
                      fontSize: 25,
                      letterSpacing: 2,
                      wordSpacing: 5,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 35.0, bottom: 30),
                child: Text(
                  "food for you",
                  style: TextStyle(
                      letterSpacing: 2,
                      wordSpacing: 5,
                      fontSize: 25,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
                ),
              ),
              TabBar(
                  labelColor: const Color(mainColor),
                  labelStyle: const TextStyle(overflow: TextOverflow.ellipsis),
                  unselectedLabelColor: Colors.grey,
                  indicator:
                      const DotIndicator(color: Color(mainColor), radius: 3),
                  controller: _tabController,
                  tabs: const [
                    Text("SANDWICHES"),
                    Text("MEALS"),
                    Text("EXTRAS")
                  ]),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TabBarView(controller: _tabController, children: [
                    FBStream(
                      stream: _sandwichStream,
                    ),
                    FBStream(
                      stream: _mealStream,
                    ),
                    FBStream(
                      stream: _extraStream,
                    )
                  ]),
                ),
              )
            ],
          ),
        ));
  }
}
