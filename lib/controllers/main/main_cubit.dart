import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../views/cart/cart_screen.dart';
import '../../views/home/home_screen.dart';
import '../../views/search/search_screen.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());

  static MainCubit get(context) => BlocProvider.of(context);

  List<Widget> screens = [HomeScreen(), SearchScreen(), CartScreen()];

  int index = 0;

  void changeScreen(int i) {
    index = i;
    emit(ChangeScreenState());
  }
}
