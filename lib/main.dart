import 'package:cubit_group_5_mohandseen/controllers/cart/cart_cubit.dart';
import 'package:cubit_group_5_mohandseen/controllers/home/home_cubit.dart';
import 'package:cubit_group_5_mohandseen/controllers/main/main_cubit.dart';
import 'package:cubit_group_5_mohandseen/views/main_layout/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'views/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CartCubit()),
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => MainCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainLayout(),
        theme: ThemeData.light(useMaterial3: true).copyWith(
          scaffoldBackgroundColor: Colors.grey[300],
          navigationBarTheme: const NavigationBarThemeData(
              labelTextStyle:
                  MaterialStatePropertyAll(TextStyle(color: Colors.white))),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.deepPurple,
            centerTitle: true,
            foregroundColor: Colors.white,
            titleTextStyle: TextStyle(
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
