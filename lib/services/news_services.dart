import 'package:dio/dio.dart';
import 'package:newsly_app/models/articles_model.dart';

class NewsServices {
  Dio dio;
  NewsServices(this.dio);

  Future<List<ArticleModel>> getGeneralNews({required String category})async{
    try {
      var response = await dio.get(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=40fbf9ee65d24f5ba235bcc3d17c2982&category=${category}');
      Map<String, dynamic> jsonData = response.data;
      // List<dynamic> Articles
      List<dynamic> articles = jsonData['articles'];
      // int c = 1;
      List<ArticleModel> articlesList = [];
      //-------------------------------------------
      for (var article in articles) {
      //   // print('$c:$article');
      //   // ++c;
        ArticleModel articleModel = ArticleModel.fromJson(article);
      //       source: Source(
      //           id: article['source']['id'], name: article['source']['name']),
      //       title: article['title'],
      //       descption: article['description'],
      //       image: article['urlToImage'],
      //       url: article['url']);
        articlesList.add(articleModel);
      //------------------------------------------------------
      // print('Response : ${jsonData.toString()}');
      // print('Articles : ${articles}');
       // return articlesList;
     return articles.map((article) =>ArticleModel.fromJson(article)).toList();
 }
    } catch (error) {
      Exception(error.toString());
     }
     return [];
  }
}
