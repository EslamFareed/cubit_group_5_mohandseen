import 'package:cubit_group_5_mohandseen/controllers/home/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = HomeCubit.get(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cubit Sample"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                cubit.add();
                // counter++;
                // setState(() {});
              },
              icon: const Icon(Icons.add),
            ),
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                print(state);
                return Text("${cubit.counter}",
                    style: TextStyle(
                        fontSize: 50,
                        color: state is AddState ? Colors.green : Colors.red));
              },
            ),
            IconButton(
              onPressed: () {
                cubit.sub();

                // counter--;
                // setState(() {});
              },
              icon: const Icon(Icons.minimize),
            ),
          ],
        ),
      ),
    );
  }
}
