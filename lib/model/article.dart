class Article{
  String? author;
  String? title;
  String? description;
  String? urlToImage;

  Article({
    this.author,
    this.title,
    this.description,
    this.urlToImage
  });

  factory Article.fromJson(Map<String, dynamic> json){
    return Article(
      author: json["author"] == null ? null : json["author"],
      title: json["title"] == null ? null : json["title"],
      description: json["description"] == null ? null : json["description"],
      urlToImage: json["urlToImage"] == null ? null : json["urlToImage"],
    );
  }
}