import 'package:cubit_group_5_mohandseen/controllers/cart/cart_cubit.dart';
import 'package:cubit_group_5_mohandseen/controllers/home/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = HomeCubit.get(context);
    cubit.getProducts();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              SearchBar(
                hintText: "Enter name , category",
                trailing: const [Icon(Icons.search)],
                onChanged: (value) {
                  cubit.search(value);
                },
              ),
              const SizedBox(height: 20),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is GetProductsLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is GetProductsError) {
                    return const Center(child: Text("Please try again later"));
                  }

                  if (cubit.filterProducts.isEmpty) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
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
                                CartCubit.get(context).addToCart(item);
                              },
                              icon: const Icon(Icons.add_shopping_cart,
                                  color: Colors.deepPurple),
                            ),
                          ),
                        );
                      },
                      itemCount: cubit.products.length,
                    );
                  } else {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final item = cubit.filterProducts[index];

                        return Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(item.image ?? ""),
                            ),
                            title: Text("${item.title} - ${item.price}"),
                            subtitle: Text("${item.category}"),
                            trailing: IconButton(
                              onPressed: () {
                                CartCubit.get(context).addToCart(item);
                              },
                              icon: const Icon(Icons.add_shopping_cart,
                                  color: Colors.deepPurple),
                            ),
                          ),
                        );
                      },
                      itemCount: cubit.filterProducts.length,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
