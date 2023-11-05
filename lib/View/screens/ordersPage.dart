import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/Logic/cubit/order_cubit.dart';
import 'package:new_app/View/screens/checkoutPage.dart';
import 'package:new_app/View/screens/homePage.dart';
import 'package:new_app/View/widgets/addToCardButton.dart';
import 'package:new_app/constants/constants.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    final orderCubit = BlocProvider.of<OrderCubit>(context);
    return BlocConsumer<OrderCubit, OrderState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
            body: orderCubit.orders.isNotEmpty
                ? Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                            itemCount: orderCubit.orders.length,
                            itemBuilder: (context, index) => Card(
                                    child: Container(
                                  child: orderCubit.orders[index].types == null
                                      ? Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              GestureDetector(
                                                child: const Icon(
                                                  Icons.delete,
                                                  color: Colors.red,
                                                ),
                                                onTap: () {
                                                  orderCubit.orders.remove(
                                                      orderCubit.orders[index]);
                                                  orderCubit.deleteMeal();
                                                },
                                              ),
                                              orderCubit.orders[index].extras !=
                                                      null
                                                  ? Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 10),
                                                      child: Row(
                                                        children: orderCubit
                                                            .orders[index]
                                                            .extras!
                                                            .map((e) => Padding(
                                                                  padding: const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          3),
                                                                  child: Text(
                                                                    e.name,
                                                                    style: const TextStyle(
                                                                        fontSize:
                                                                            10,
                                                                        color: Colors
                                                                            .blueGrey),
                                                                  ),
                                                                ))
                                                            .toList(),
                                                      ),
                                                    )
                                                  : Text(""),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 20.0),
                                                child: Text(
                                                  '${orderCubit.orders[index].totalPrice.toString()} EGP',
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color(mainColor)),
                                                ),
                                              ),
                                              Text(
                                                orderCubit.orders[index]
                                                    .numberOfPurchased
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(mainColor)),
                                              ),
                                              Container(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  width: 100,
                                                  child: Text(orderCubit
                                                      .orders[index].name)),
                                            ],
                                          ),
                                        )
                                      : Column(
                                          children: orderCubit
                                              .orders[index].types!
                                              .map((x) => Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 10,
                                                        vertical: 5),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        GestureDetector(
                                                          child: const Icon(
                                                            Icons.delete,
                                                            color: Colors.red,
                                                          ),
                                                          onTap: () {
                                                            orderCubit
                                                                .orders[index]
                                                                .types!
                                                                .remove(x);

                                                            if (orderCubit
                                                                .orders[index]
                                                                .types!
                                                                .isEmpty) {
                                                              orderCubit.orders
                                                                  .remove(orderCubit
                                                                          .orders[
                                                                      index]);
                                                            }

                                                            orderCubit
                                                                .deleteMeal();
                                                          },
                                                        ),
                                                        orderCubit.orders[index]
                                                                    .extras !=
                                                                null
                                                            ? Padding(
                                                                padding: const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        10),
                                                                child: Row(
                                                                  children: orderCubit
                                                                      .orders[
                                                                          index]
                                                                      .extras!
                                                                      .map((e) =>
                                                                          Padding(
                                                                            padding:
                                                                                const EdgeInsets.symmetric(horizontal: 3),
                                                                            child:
                                                                                Text(
                                                                              e.name,
                                                                              style: const TextStyle(fontSize: 10, color: Colors.blueGrey),
                                                                            ),
                                                                          ))
                                                                      .toList(),
                                                                ),
                                                              )
                                                            : const Text(""),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  right: 20.0),
                                                          child: Text(
                                                            '${x.totalPrice.toString()} EGP',
                                                            style: const TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Color(
                                                                    mainColor)),
                                                          ),
                                                        ),
                                                        Text(
                                                            x.numberOfPurchased
                                                                .toString(),
                                                            style: const TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Color(
                                                                    mainColor))),
                                                        Container(
                                                            alignment: Alignment
                                                                .centerRight,
                                                            width: 100,
                                                            child: Text(
                                                              x.typeName,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            )),
                                                      ],
                                                    ),
                                                  ))
                                              .toList(),
                                        ),
                                ))),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: AddToCard(
                          text: "CHECK OUT",
                          onTap: () {
                            orderCubit.CalctotalORderPrice();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Checkout(),
                                ));
                          },
                        ),
                      )
                    ],
                  )
                : Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "YOU HAVEN'T ORDERED YET",
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomePage(),
                                  ));
                            },
                            child: const Text("ORDER NOW",
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: Color(mainColor))))
                      ],
                    ),
                  ));
      },
    );
  }
}
