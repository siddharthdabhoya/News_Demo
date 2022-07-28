import 'package:flutter/material.dart';
import 'package:news_demo/model/article.dart';
import 'package:news_demo/service/api_service.dart';

class NewsData extends StatelessWidget {
  final Article article;
  const NewsData({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('News Demo'),
    ),
    body: Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network('${article.urlToImage}'),
        ),
        Text('${article.author}'),
        Card(
          elevation: 15,
          child: ListTile(
            title: Text('${article.title}'),
            subtitle: Text('${article.description}'),
          ),
        ),
      ],
    ),
    );
  }
}
