import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../custom_widget/custom_radio_button.dart';
import '../../web_services/firebase_auth_service.dart';

class SignUpScreenController extends GetxController{
  TextEditingController emailTEController = TextEditingController();
  TextEditingController passwordTEController = TextEditingController();
  TextEditingController confirmPasswordTEController = TextEditingController();
  TextEditingController userNameTEController = TextEditingController();
  TextEditingController lastNameTEController = TextEditingController();
  TextEditingController fsNameTEController = TextEditingController();
  RxBool emailErrorVisible = RxBool(false);
  RxString emailErrorMsg = "".obs;
  RxBool passwordErrorVisible = RxBool(false);
  RxString passwordErrorMsg = "".obs;
  RxBool userNameErrorVisible = RxBool(false);
  RxString userNameErrorMsg = "".obs;
  RxBool lastNameErrorVisible = RxBool(false);
  RxString lastNameErrorMsg = "".obs;
  RxBool fsNameErrorVisible = RxBool(false);
  RxString fsNameErrorMsg = "".obs;

  Rx<Gender> selectedGender=Gender.male.obs;
  RxBool confirmPasswordErrorVisible = RxBool(false);
  RxString confirmPasswordErrorMsg = "".obs;
  RxBool obscured = true.obs,isTap=false.obs,isPrivacyPolicy=false.obs;

  FocusNode emailFocusNode = FocusNode(),
      passwordFocusNode = FocusNode(),
      confirmPasswordFocusNode = FocusNode(),
      lastNameFocusNode = FocusNode(),
      fsNameFocusNode = FocusNode(),
      userNameFocusNode = FocusNode();


  bool confirmPasswordValidation(String value) {
    if (value.trim() == "") {
      confirmPasswordErrorVisible.value = true;
      confirmPasswordErrorMsg.value = "Confirm Password is required!";
    }
    else if (!validateBothPassword()) {
      confirmPasswordErrorVisible.value = true;
      confirmPasswordErrorMsg.value = "Passwords does not match";
    } else {
      confirmPasswordErrorVisible.value = false;
      confirmPasswordErrorMsg.value = "";
    }
    return confirmPasswordErrorVisible.value;
  }

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
    }else if(!value.trim().contains(RegExp(r'^(?=.*?[0-9])'))){
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
    } else if (confirmPasswordFocusNode.hasFocus) {
      confirmPasswordFocusNode.unfocus();
    }else if (userNameFocusNode.hasFocus) {
      userNameFocusNode.unfocus();
    }else if (lastNameFocusNode.hasFocus) {
      lastNameFocusNode.unfocus();
    }else if (fsNameFocusNode.hasFocus) {
      fsNameFocusNode.unfocus();
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

  bool usernameValidation(String value) {
    if (value.trim() == "") {
      userNameErrorVisible.value = true;
      userNameErrorMsg.value = "Firstname is required!";
    } else if (value.trim().length<3) {
      userNameErrorVisible.value = true;
      userNameErrorMsg.value = "Invalid Lastname!";
    } else {
      userNameErrorVisible.value = false;
      userNameErrorMsg.value = "";
    }
    return userNameErrorVisible.value;
  }

  bool lastnameValidation(String value) {
    if (value.trim() == "") {
      lastNameErrorVisible.value = true;
      lastNameErrorMsg.value = "Lastname is required!";
    } else if (value.trim().length<3) {
      lastNameErrorVisible.value = true;
      lastNameErrorMsg.value = "Invalid Lastname!";
    } else {
      lastNameErrorVisible.value = false;
      lastNameErrorMsg.value = "";
    }
    return lastNameErrorVisible.value;
  }

  bool fsNameValidation(String value) {
    if (value.trim() == "") {
      fsNameErrorVisible.value = true;
      fsNameErrorMsg.value = "Father/Spouse is required!";
    } else if (value.trim().length<3) {
      fsNameErrorVisible.value = true;
      fsNameErrorMsg.value = "Invalid!";
    } else {
      fsNameErrorVisible.value = false;
      fsNameErrorMsg.value = "";
    }
    return fsNameErrorVisible.value;
  }

  //Methods
  void toggleObscured() {
    obscured.value = !obscured.value;
    if (passwordFocusNode.hasPrimaryFocus) {
      return;
    }
    passwordFocusNode.canRequestFocus = false;
  }

  bool validateBothPassword(){
    return confirmPasswordTEController.text == passwordTEController.text &&
        passwordTEController.text.length >= 8 &&
        confirmPasswordTEController.text.length >= 8;
  }



  Future<void> onSignUpTap() async{
    removeAFieldsFocus();
    bool isAllDataValid = false;
    isAllDataValid = !emailValidation(emailTEController.text);
    isAllDataValid = !passwordValidation(passwordTEController.text) && isAllDataValid;
    isAllDataValid = !confirmPasswordValidation(confirmPasswordTEController.text) && isAllDataValid;
    if(isAllDataValid){
      isTap.value=true;
      try{
        await AuthService().createUser(email: emailTEController.text, password: passwordTEController.text);
        isTap.value=false;
        Get.back();
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

  void onPrivacyPolicy(){
    isPrivacyPolicy.value=!isPrivacyPolicy.value;
  }

}