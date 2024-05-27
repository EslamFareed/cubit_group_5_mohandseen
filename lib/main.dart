import 'package:cubit_group_5_mohandseen/controllers/home/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'views/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit()),
        // BlocProvider(create: (context) => HomeCubit()),
        // BlocProvider(create: (context) => HomeCubit()),
        // BlocProvider(create: (context) => HomeCubit()),
        // BlocProvider(create: (context) => HomeCubit()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
