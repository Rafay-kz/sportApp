import 'package:get/get.dart';
import 'package:sport_app/utils/app_constant.dart';
import 'package:sport_app/utils/screen_binding.dart';
import 'package:sport_app/view/auth_screens/signin_screen.dart';
import 'package:sport_app/view/auth_screens/signup_screen.dart';
import 'package:sport_app/view/home_screens/sport_screen.dart';



class RouteGenerator {
  static List<GetPage> getPages() {
    return [
      GetPage(
        name: kLoginScreen,
        page: () => const SignInScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: kSignupScreen,
        page: () => const SignUpScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: kSportScreen,
        page: () => const SportScreen(),
        binding: ScreenBindings(),
      ),

    ];
  }


}