import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controllers/main/main_cubit.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = MainCubit.get(context);

    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        return Scaffold(
          body: cubit.screens[cubit.index],
          bottomNavigationBar: NavigationBar(
            backgroundColor: Colors.deepPurple,
            indicatorColor: Colors.white,
            selectedIndex: cubit.index,
            onDestinationSelected: (value) {
              cubit.changeScreen(value);
            },
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            destinations: const [
              NavigationDestination(
                selectedIcon: Icon(Icons.home, color: Colors.deepPurple),
                icon: Icon(Icons.home_outlined, color: Colors.white),
                label: "Home",
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.search, color: Colors.deepPurple),
                icon: Icon(Icons.search, color: Colors.white),
                label: "Search",
              ),
              NavigationDestination(
                selectedIcon:
                    Icon(Icons.shopping_bag, color: Colors.deepPurple),
                icon: Icon(Icons.shopping_bag_outlined, color: Colors.white),
                label: "Cart",
              ),
            ],
          ),
        );
      },
    );
  }
}
