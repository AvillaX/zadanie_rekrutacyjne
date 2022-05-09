import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zadanie_rekrutacyjne/cubit/app_cubits.dart';
import 'package:zadanie_rekrutacyjne/model/api_service.dart';
import 'package:zadanie_rekrutacyjne/model/articles_model.dart';
import 'package:zadanie_rekrutacyjne/pages/loty.dart';

class Ulubione extends StatefulWidget {
  const Ulubione({Key? key}) : super(key: key);

  @override
  State<Ulubione> createState() => _UlubioneState();
}

class _UlubioneState extends State<Ulubione> {
  @override
  Widget build(BuildContext context) {
    ApiService repository = ApiService();
    return Container(
      color: Colors.blueAccent.withOpacity(0.7),
      child: FutureBuilder(
        future: repository.getArticles(),
        builder: (BuildContext context,
            AsyncSnapshot<List<ArticlesModel>> snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: Text('Loading'),
            );
          } else {
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                if (checkedIcon[index] == true) {
                  return GestureDetector(
                    onTap: () {
                      BlocProvider.of<AppCubits>(context)
                          .detialPage(snapshot.data![index]);
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20))),
                      child: ListTile(
                        leading: IconButton(
                            onPressed: () {
                              setState(() {
                                checkedIcon[index] = !checkedIcon[index];
                              });
                            },
                            icon: checkedIcon[index]
                                ? const Icon(Icons.favorite_outlined)
                                : const Icon(Icons.favorite_outline)),
                        title: Text(snapshot.data![index].title),
                      ),
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
              itemCount: snapshot.data!.length,
            );
          }
        },
      ),
    );
  }
}
