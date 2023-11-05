part of 'order_cubit.dart';

@immutable
sealed class OrderState {}

final class OrderInitial extends OrderState {}
final class OrderAddedToOrderPage extends OrderState {}
final class OrderRemovedFromOrderPage extends OrderState {}
final class TotalPriceIsCalculated extends OrderState {}
