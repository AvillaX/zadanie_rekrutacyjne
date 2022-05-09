import 'dart:convert';
import 'package:http/http.dart' as http;
import 'articles_model.dart';

String baseUrl = '';

Uri articlesUri() => Uri(
      scheme: 'https',
      host: 'api.spaceflightnewsapi.net',
      path: 'v3/articles',
      //queryParameters: {},
    );

class ApiService {
  Future<List<ArticlesModel>> getArticles() async {
    List<ArticlesModel> articles = [];
    final response = await http.get(articlesUri());
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      for (var datas in data) {
        ArticlesModel article = ArticlesModel(
            id: datas["id"],
            title: datas["title"],
            summary: datas["summary"],
            imageUrl: datas["imageUrl"]);

        articles.add(article);
      }

      return articles;
    }
    throw response;
  }
}
