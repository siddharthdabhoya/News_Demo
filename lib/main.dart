import 'package:flutter/material.dart';
import 'package:news_demo/model/article.dart';
import 'package:news_demo/newsData.dart';
import 'package:news_demo/service/api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  ApiService apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Demo'),
      ),
      body: FutureBuilder(
        future: apiService.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, index){
                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => NewsData(article: snapshot.data![index])));
                  },
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network('${snapshot.data![index].urlToImage}'),
                        ),
                      Card(
                        elevation: 15,
                        child: ListTile(
                          title: Text('${snapshot.data![index].title}'),
                          subtitle: Text('${snapshot.data![index].author}'),
                        ),
                      ),
                    ],
                  ),
                );
              }
            );
          } return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
