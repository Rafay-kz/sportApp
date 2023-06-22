import 'package:get/get.dart';
import 'package:sport_app/controller/auth_screen_controller/signup_screen_controller.dart';
import 'package:sport_app/controller/auth_screen_controller/singin_screen_controller.dart';
import 'package:sport_app/controller/home_screen_controller/sport_screen_controller.dart';


class ScreenBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SignInScreenController());
    Get.lazyPut(() => SignUpScreenController());
    Get.lazyPut(() => SportScreenController());
  }
}