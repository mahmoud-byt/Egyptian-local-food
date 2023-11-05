part of 'counter_cubit.dart';

@immutable
abstract class CounterState {}

final class CounterInitial extends CounterState {}

final class CounterIncreased extends CounterState {}

final class CounterDecreased extends CounterState {}

