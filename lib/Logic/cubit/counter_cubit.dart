import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:new_app/Models/sandwichModel.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit({this.meal, this.types}) : super(CounterInitial());
  Meal? meal;
  List<Type>? types;
  void increseCounter(int? n) {
    meal!.types == null
        ? meal!.numberOfPurchased++
        : types![n!].numberOfPurchased++;
    emit(CounterIncreased());
  }

  void decreseCounter(int? n) {
    meal?.numberOfPurchased--;
    types?[n!].numberOfPurchased--;
    emit(CounterDecreased());
  }

}
