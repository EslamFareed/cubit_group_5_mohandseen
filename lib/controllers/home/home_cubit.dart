import 'package:bloc/bloc.dart';
import 'package:cubit_group_5_mohandseen/models/product_model.dart';
import 'package:cubit_group_5_mohandseen/views/home/home_screen.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  List<ProductModel> products = [];
  var dio = Dio();
  void getProducts() async {
    emit(GetProductsLoading());
    try {
      var response = await dio.get("https://fakestoreapi.com/products");

      if (response.statusCode == 200) {
        var list = response.data as List;
        products = list.map((e) => ProductModel.fromJson(e)).toList();
        emit(GetProductsSuccess());
      } else {
        emit(GetProductsError());
      }
    } catch (e) {
      print(e.toString());
      emit(GetProductsError());
    }
  }

  List<ProductModel> filterProducts = [];

  void search(String text) {
    filterProducts = products
        .where((e) =>
            e.title!.toLowerCase().contains(text.toLowerCase()) ||
            e.category!.toLowerCase().contains(text.toLowerCase()))
        .toList();

    emit(FilterProductsState());    
  }
}
