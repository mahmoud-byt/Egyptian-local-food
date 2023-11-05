import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/Logic/cubit/counter_cubit.dart';
import 'package:new_app/Logic/cubit/extra_cubit.dart';
import 'package:new_app/Logic/cubit/order_cubit.dart';
import 'package:new_app/Models/sandwichModel.dart';
import 'package:new_app/View/widgets/addToCardButton.dart';
import 'package:new_app/View/widgets/choices.dart';
import 'package:new_app/View/widgets/counterWidget.dart';
import 'package:new_app/View/widgets/customizedIcon.dart';

// ignore: must_be_immutable
class OneMeal extends StatelessWidget {
  OneMeal({super.key, required this.meal});
  Meal meal;

  @override
  Widget build(BuildContext context) {
    final counterCubit = BlocProvider.of<CounterCubit>(context);
    final extraCubit = BlocProvider.of<ExtraCubit>(context);
    final orderCubit = BlocProvider.of<OrderCubit>(context);
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(meal.image), fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(10)),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CustomizedIcon(
                        onTap: () {},
                        icon: Icons.favorite_outline,
                      )),
                ),
                Positioned(
                  left: 0,
                  top: 0,
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CustomizedIcon(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        icon: Icons.arrow_back,
                      )),
                ),
              ],
            ),
            (meal.extras == null)
                ? Text("")
                : Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "What do you need on your sandwich ?",
                          style: TextStyle(
                              fontStyle: FontStyle.italic, fontSize: 20),
                        ),
                        BlocConsumer<ExtraCubit, ExtraState>(
                          listener: (context, state) {
                            extraCubit.extras = meal.extras;
                          },
                          builder: (context, state) {
                            return Container(
                              height: meal.extras!.length < 4 ? 40 : 80,
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              child: GridView.builder(
                                  itemCount: meal.extras!.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount:
                                              meal.extras!.length < 3
                                                  ? meal.extras!.length
                                                  : 3,
                                          mainAxisExtent: 30,
                                          crossAxisSpacing: 5,
                                          mainAxisSpacing: 5),
                                  itemBuilder: (context, i) => Choise(
                                        text: meal.extras![i].name,
                                        extra: meal.extras![i],
                                        onTap: () {
                                          extraCubit.extra = meal.extras![i];
                                          extraCubit.makeItChoosen();
                                        },
                                      )),
                            );
                          },
                        )
                      ],
                    ),
                  ),
            meal.types == null
                ? Card(
                    elevation: 5,
                    child: ListTile(
                      trailing: Text(meal.name),
                      title: Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: Text('${meal.price} EGP')),
                      leading: BlocConsumer<CounterCubit, CounterState>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          counterCubit.meal = meal;
                          counterCubit.types = meal.types;
                          return Counter(
                              counter: meal.numberOfPurchased,
                              decrease: () {
                                if (meal.numberOfPurchased > 0) {
                                  counterCubit.decreseCounter(null);
                                }
                              },
                              increase: () {
                                counterCubit.increseCounter(null);
                              });
                        },
                      ),
                    ),
                  )
                : Container(
                    height: 60 * meal.types!.length.toDouble(),
                    child: ListView.builder(
                      itemBuilder: (context, i) => Card(
                        elevation: 5,
                        child: ListTile(
                          trailing: Text(meal.types![i].typeName),
                          title: Padding(
                              padding: const EdgeInsets.only(left: 40),
                              child: Text(
                                  '${meal.types![i].price.toString()} EGP')),
                          leading: BlocConsumer<CounterCubit, CounterState>(
                            listener: (context, state) {},
                            builder: (context, state) {
                              counterCubit.types = meal.types;
                              counterCubit.meal = meal;
                              return Counter(
                                  counter: meal.types![i].numberOfPurchased,
                                  decrease: () {
                                    if (meal.types![i].numberOfPurchased > 0) {
                                      counterCubit.decreseCounter(i);
                                    }
                                  },
                                  increase: () {
                                    counterCubit.increseCounter(i);
                                  });
                            },
                          ),
                        ),
                      ),
                      itemCount: meal.types!.length,
                    ),
                  ),
            AddToCard(
              text: "ADD TO ORDER",
              onTap: () {
                orderCubit.addMealToOrders(meal);
                extraCubit.clearAllChoosen();
              },
            )
          ]),
        ),
      ),
    ));
  }
}
