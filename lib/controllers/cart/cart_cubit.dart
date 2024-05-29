import 'package:bloc/bloc.dart';
import 'package:cubit_group_5_mohandseen/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  static CartCubit get(context) => BlocProvider.of(context);

  List<ProductModel> products = [];

  void addToCart(ProductModel item) {
    if (!products.contains(item)) {
      products.add(item);
    }
    emit(CartChangeState());
  }

  void removeFromCart(ProductModel item) {
    if (products.contains(item)) {
      products.remove(item);
    }

    emit(CartChangeState());
  }
}
