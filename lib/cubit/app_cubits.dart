import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zadanie_rekrutacyjne/model/api_service.dart';
import 'package:zadanie_rekrutacyjne/cubit/app_cubit_states.dart';
import 'package:zadanie_rekrutacyjne/model/articles_model.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits({required this.repository}) : super(InitialState()) {
    emit(WelcomeState());
  }

  final ApiService repository;
  void articles() async {
    try {
      final articles = await repository.getArticles();

      emit(ArticlesState(articles));
    } catch (e) {
      print("error");
    }
  }

  detialPage(ArticlesModel data) {
    emit(DetailState(data));
  }

  goBack() {
    emit(WelcomeState());
  }
}
