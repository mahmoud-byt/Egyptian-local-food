import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/Models/sandwichModel.dart';

part 'extra_state.dart';

class ExtraCubit extends Cubit<ExtraState> {
  ExtraCubit({this.extra, this.extras}) : super(ExtraInitial());
  Extra? extra;
  List<Extra>? extras;
  void makeItChoosen() {
    extra?.isChoosen = !extra!.isChoosen;
    emit(ExtraChoosen());
  }

  void clearAllChoosen() {
    extras?.forEach((e) => e.isChoosen = false);
    emit(AllChoosenCleared());
  }
}
