import 'package:get/get.dart';
import 'package:sport_app/model/get_news_model.dart';
import 'package:sport_app/web_services/sport_news_service.dart';

class SportScreenController extends GetxController{
  Rx<GetNewsModel> news=GetNewsModel.empty().obs;
  RxBool showContainer=false.obs;
  NewsService newsService=NewsService();
  String text='';

  @override
  void onInit() {
    super.onInit();
    fetchAllNews();

  }

  void fetchAllNews() async{
    news.value=await newsService.getNews();
    showContainer.value=true;
  }

}