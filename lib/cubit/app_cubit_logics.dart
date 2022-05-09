import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zadanie_rekrutacyjne/cubit/app_cubit_states.dart';
import 'package:zadanie_rekrutacyjne/cubit/app_cubits.dart';
import 'package:zadanie_rekrutacyjne/pages/detail_page.dart';
import 'package:zadanie_rekrutacyjne/home_page.dart';

class AppCubitLogics extends StatefulWidget {
  AppCubitLogics({Key? key}) : super(key: key);

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if (state is WelcomeState) {
            return const HomePage();
          }
          if (state is DetailState) {
            final articles = state.article;
            return const DetailPage();
          }
          return Container();
        },
      ),
    );
  }
}
