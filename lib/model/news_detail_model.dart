import 'dart:developer';

class NewsDetailModel{

  String title='';
  String description='';
  String url='';
  String urlToImage='';

  NewsDetailModel({required this.title, required this.description, required this.url, required this.urlToImage});
  NewsDetailModel.empty();

  factory NewsDetailModel.fromJson(Map<String, dynamic> json) {
    return NewsDetailModel(
      title: json["title"] ?? '',
      description: json["description"] ?? '',
      url: json["url"] ?? '',
      urlToImage: json["urlToImage"] ?? '',
    );
  }

  @override
  String toString() {
    return 'NewsDetailModel{title: $title, description: $description, url: $url, urlToImage: $urlToImage}';
  }
}