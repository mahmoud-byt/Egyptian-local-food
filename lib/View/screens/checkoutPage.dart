import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/Logic/cubit/order_cubit.dart';
import 'package:new_app/constants/constants.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    final orderCubit = BlocProvider.of<OrderCubit>(context);
    return Scaffold(
        body: BlocConsumer<OrderCubit, OrderState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Center(
          child: Card(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.height / 2,
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("TOTAL PRICE"),
                    Text(
                      "${orderCubit.totalOrderPrice.toString()} EGP",
                      style: const TextStyle(color: Color(mainColor)),
                    )
                  ],
                )
              ]),
            ),
          ),
        );
      },
    ));
  }
}
