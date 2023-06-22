
import 'package:get/get_connect/connect.dart';
import 'package:sport_app/model/get_news_model.dart';


class NewsService extends GetConnect{

  static final NewsService _instance = NewsService._internal();
  NewsService._internal();

  factory NewsService() => _instance;

  Future <GetNewsModel> getNews() async{
    Response response=await get('https://newsapi.org/v2/top-headlines?country=au&apiKey=436e97cfd18f4ec19ae57f011daf815f');
    GetNewsModel getNewsModel = GetNewsModel.fromJson(response.body);
    return getNewsModel;
  }


}