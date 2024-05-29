import 'package:cubit_group_5_mohandseen/controllers/cart/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = CartCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (cubit.products.isEmpty) {
            return const Center(
              child: Text("No products Found in Cart"),
            );
          }
          return ListView.builder(
            itemBuilder: (context, index) {
              final item = cubit.products[index];

              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(item.image ?? ""),
                  ),
                  title: Text("${item.title} - ${item.price}"),
                  subtitle: Text("${item.category}"),
                  trailing: IconButton(
                    onPressed: () {
                      CartCubit.get(context).removeFromCart(item);
                    },
                    icon: const Icon(Icons.delete, color: Colors.deepPurple),
                  ),
                ),
              );
            },
            itemCount: cubit.products.length,
          );
        },
      ),
    );
  }
}
