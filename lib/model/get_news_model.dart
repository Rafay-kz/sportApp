
import 'package:sport_app/model/news_detail_model.dart';

class GetNewsModel {
  String status='';
  int totalResults=0;
  List<NewsDetailModel> articles=[];

  GetNewsModel({required this.status, required this.totalResults, required this.articles});
  GetNewsModel.empty();

  GetNewsModel.fromJson(Map<String, dynamic> json) {
    status = json['status']??'';
    totalResults = json['totalResults']??0;
    if (json['articles'] != null) {
      articles = <NewsDetailModel>[];
      json['articles'].forEach((v) {
        articles.add(NewsDetailModel.fromJson(v));
      });
    }
  }

  @override
  String toString() {
    return 'GetNewsModel{status: $status, totalResults: $totalResults, articles: $articles}';
  }
}
