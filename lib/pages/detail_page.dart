import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zadanie_rekrutacyjne/cubit/app_cubit_states.dart';
import 'package:zadanie_rekrutacyjne/cubit/app_cubits.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      DetailState detail = state as DetailState;
      return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.lightBlue,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {
                  BlocProvider.of<AppCubits>(context).goBack();
                },
                icon: const Icon(Icons.arrow_back)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
              child: Wrap(children: [
                Text(
                  detail.article.title,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                )
              ]),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 50),
              child: Wrap(children: [
                Text(
                  detail.article.summary,
                  style: const TextStyle(fontSize: 15),
                )
              ]),
            ),
            Container(
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(detail.article.imageUrl),
                        fit: BoxFit.cover))),
          ],
        ),
      );
    });
  }
}
