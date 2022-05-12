import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zadanie_rekrutacyjne/model/api_service.dart';
import 'package:zadanie_rekrutacyjne/cubit/app_cubits.dart';
import 'package:zadanie_rekrutacyjne/model/articles_model.dart';
//import 'package:http/http.dart' as http;

List<bool> checkedIcon = List<bool>.filled(100, false);

class Loty extends StatefulWidget {
  const Loty({Key? key}) : super(key: key);

  @override
  State<Loty> createState() => _LotyState();
}

class _LotyState extends State<Loty> {
  ApiService repository = ApiService();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            color: Colors.blue.withOpacity(0.5),
            child: FutureBuilder(
              future: repository.getArticles(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<ArticlesModel>> snapshot) {
                if (snapshot.data == null) {
                  return const Center(
                    child: Text('Loading'),
                  );
                } else {
                  return RefreshIndicator(
                    onRefresh: () => repository.getArticles(),
                    child: ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            BlocProvider.of<AppCubits>(context)
                                .detialPage(snapshot.data![index]);
                          },
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(20))),
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
                      },
                      itemCount: snapshot.data!.length,
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
