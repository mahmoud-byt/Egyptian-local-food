part of 'extra_cubit.dart';

@immutable
sealed class ExtraState {}

final class ExtraInitial extends ExtraState {}
final class ExtraChoosen extends ExtraState {}
final class AllChoosenCleared extends ExtraState {}
