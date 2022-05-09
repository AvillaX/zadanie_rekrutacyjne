import 'package:equatable/equatable.dart';
import 'package:zadanie_rekrutacyjne/model/articles_model.dart';

abstract class CubitStates extends Equatable {}

class InitialState extends CubitStates {
  @override
  List<Object?> get props => [];
}

class WelcomeState extends CubitStates {
  @override
  List<Object?> get props => [];
}

class ArticlesState extends CubitStates {
  ArticlesState(this.articles);

  final List<ArticlesModel> articles;

  @override
  List<Object?> get props => [];
}

class DetailState extends CubitStates {
  DetailState(this.article);

  final ArticlesModel article;

  @override
  List<Object?> get props => [article];
}
