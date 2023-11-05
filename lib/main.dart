import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/Logic/cubit/counter_cubit.dart';
import 'package:new_app/Logic/cubit/extra_cubit.dart';
import 'package:new_app/Logic/cubit/order_cubit.dart';
import 'package:new_app/View/screens/homepage.dart';
import 'package:new_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiBlocProvider(
    providers:[
      BlocProvider(
        create: (context) => CounterCubit(),
      ),
      BlocProvider(
        create: (context) => ExtraCubit(),
      ),
      BlocProvider(
        create: (context) => OrderCubit(),
      )
    ],
    child: MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  ));
}
