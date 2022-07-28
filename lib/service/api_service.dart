import 'dart:convert';

import 'package:http/http.dart';
import 'package:news_demo/model/article.dart';

class ApiService{
  final endpoint = "https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=c42ff0f18f554e46a67c2f41c87ba98f";

  Future<List<Article>> getArticle() async{
    Response response = await get(Uri.parse(endpoint));

    if(response.statusCode == 200){
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> body = json['articles'];
      List<Article> articles = body.map((dynamic item) => Article.fromJson(item)).toList();
      return articles;
    }
    else{
      throw("Data has error");
    }
  }
}