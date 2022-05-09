import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zadanie_rekrutacyjne/model/api_service.dart';
import 'package:zadanie_rekrutacyjne/cubit/app_cubit_logics.dart';
import 'package:zadanie_rekrutacyjne/cubit/app_cubits.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<AppCubits>(
        create: (context) => AppCubits(repository: ApiService()),
        child: AppCubitLogics(),
      ),
    );
  }
}
