import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_app/utils/app_colors.dart';
import '../../controller/home_screen_controller/sport_screen_controller.dart';

class SportScreen extends GetView<SportScreenController>{
  const SportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text('News Aggregator',style: TextStyle(color: AppColors.whiteColor),),
        backgroundColor: AppColors.redColor,
      ),
      body: SizedBox(
      height: Get.height,
      width: Get.width,
      child: Obx(()=>
      controller.news.value.articles.isNotEmpty?
      ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: controller.news.value.articles.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return detailCard(index);
        },):
      const Center(child: CircularProgressIndicator()),
      ),
    ),
    );
  }

  Widget detailCard(int index){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 8),
      child: Container(
        width: Get.width,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              // spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0.0, 1.0), //(x,y)
            ),
          ],
        ),
        child: Row(
          children: [
            CachedNetworkImage(imageUrl: controller.news.value.articles[index].urlToImage, width: 100,height: 100,fit: BoxFit.fill,errorWidget: (c,d,e)=>const Icon(Icons.error,color: AppColors.lightBlackColor,),),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                child: Text(controller.news.value.articles[index].title,style: const TextStyle(fontSize: 15,color: AppColors.darkBlueColor)),
              ),
            ),
          ],
        ),
      ),
    );

  }


}