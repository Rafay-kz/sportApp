import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sport_app/web_services/firebase_auth_service.dart';

import '../../utils/app_constant.dart';

class SignInScreenController extends GetxController{
  TextEditingController emailTEController = TextEditingController();
  TextEditingController passwordTEController = TextEditingController();
  RxBool emailErrorVisible = RxBool(false);
  RxString emailErrorMsg = "".obs;
  RxBool passwordErrorVisible = RxBool(false);
  RxString passwordErrorMsg = "".obs;
  RxBool obscured = true.obs,isRemember=false.obs,isTap=false.obs;

  FocusNode emailFocusNode = FocusNode(),
      passwordFocusNode = FocusNode();

  bool passwordValidation(String value) {
    if (value.trim() == "") {
      passwordErrorVisible.value = true;
      passwordErrorMsg.value = "Password is required!";
    } else if (value.trim().length < 8 ||
        value.isEmpty) {
      passwordErrorVisible.value = true;
      passwordErrorMsg.value = "Password should be of at least 8 Characters!";
    }else if(!value.trim().contains(RegExp(r'^(?=.*?[A-Z])'))){
      passwordErrorVisible.value = true;
      passwordErrorMsg.value = "Password should be contain at least 1 capital letter";
    }/*else if(!value.trim().contains(RegExp(r'^(?=.*?[.])'))){
      passwordErrorVisible.value = true;
      passwordErrorMsg.value = "Password should be conatin (.)";
    }*/else if(!value.trim().contains(RegExp(r'^(?=.*?[0-9])'))){
      passwordErrorVisible.value = true;
      passwordErrorMsg.value = "Password should be at least a digit";
    }
    else {
      passwordErrorVisible.value = false;
      passwordErrorMsg.value = "";
    }
    return passwordErrorVisible.value;
  }

  void removeAFieldsFocus() {
    if (emailFocusNode.hasFocus) {
      emailFocusNode.unfocus();
    } else if (passwordFocusNode.hasFocus) {
      passwordFocusNode.unfocus();
    }
  }

  bool isValidEmail(String email) {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }

  bool emailValidation(String value) {
    if (value.trim() == "") {
      emailErrorVisible.value = true;
      emailErrorMsg.value = "Email is required!";
    } else if (isValidEmail(value) != true) {
      emailErrorVisible.value = true;
      emailErrorMsg.value = "Invalid Email!";
    } else {
      emailErrorVisible.value = false;
      emailErrorMsg.value = "";
    }
    return emailErrorVisible.value;
  }

  void toggleObscured() {
    obscured.value = !obscured.value;
    if (passwordFocusNode.hasPrimaryFocus) {
      return;
    }
    passwordFocusNode.canRequestFocus = false;
  }

  Future<void> onSignInTap() async{
    removeAFieldsFocus();
    bool isAllDataValid = false;
    isAllDataValid = !emailValidation(emailTEController.text);
    isAllDataValid = !passwordValidation(passwordTEController.text) && isAllDataValid;
    if(isAllDataValid){
      isTap.value=true;
      try{
        await AuthService().signIn(email: emailTEController.text, password: passwordTEController.text);
        isTap.value=false;
        Get.toNamed(kSportScreen);
      }on FirebaseAuthException catch(e){
        isTap.value=false;
        Get.snackbar(
          "Error",
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }

  void isRememberMeTap(){
    isRemember.value = !isRemember.value;
  }

}