import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/Models/sandwichModel.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitial());
  List<Meal> orders = [];
  double totalOrderPrice = 0.0;
  addMealToOrders(Meal meal) {
    orders.add(Meal(
        name: meal.name,
        numberOfPurchased: meal.numberOfPurchased,
        image: meal.image,
        totalPrice:
            meal.price != null ? meal.price! * meal.numberOfPurchased : null,
        types: meal.types != null
            ? List<Type>.from(meal.types!
                .map((e) => Type(
                    price: e.price,
                    typeName: e.typeName,
                    numberOfPurchased: e.numberOfPurchased,
                    totalPrice: e.price * e.numberOfPurchased))
                .where((element) => element.numberOfPurchased > 0))
            : null,
        extras: meal.extras != null
            ? meal.extras!.where((extra) => extra.isChoosen == true).toList()
            : null,
        price: meal.price));

    emit(OrderAddedToOrderPage());
  }

  deleteMeal() {
    emit(OrderRemovedFromOrderPage());
  }

  CalctotalORderPrice() {
    totalOrderPrice = 0;
    orders.forEach((e) {
      totalOrderPrice += e.totalPrice ??= 0;
      e.types?.forEach((element) {
        totalOrderPrice += element.totalPrice ??= 0;
      });
    });
    emit(TotalPriceIsCalculated());
  }
}
