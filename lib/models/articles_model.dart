class ArticleModel {
  final String? title;
  final String? descption;
  final String? image;
  final String? url;
  // final String? publishedAt;
  final Source? source;
  ArticleModel(
      {required this.url,
      required this.source,
      required this.title,
      required this.descption,
      required this.image});

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      source: Source(id: json['source']['id'], name: json['source']['name']),
      title: json['title'],
      descption: json['description'],
      image: json['urlToImage'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'title': title,
      'description': descption,
      'urlToImage': image,
      'url': url,
      'source': {'id': source?.id, 'name': source?.name}
    };
  }
}

class Source {
  final String? id;
  final String? name;
  Source({required this.id, required this.name});
}
