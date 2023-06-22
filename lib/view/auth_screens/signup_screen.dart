import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_app/utils/app_colors.dart';

import '../../controller/auth_screen_controller/signup_screen_controller.dart';
import '../../custom_widget/custom_app_button.dart';
import '../../custom_widget/custom_scaffold.dart';
import '../../custom_widget/custom_text_widget.dart';
import '../../custom_widget/custom_textfield.dart';
import '../../custom_widget/custom_radio_button.dart';

class SignUpScreen extends GetView<SignUpScreenController>{
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      onScreenTap: controller.removeAFieldsFocus,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0,),
              child: Image.asset(
                "assets/icons/app-icon.png",
                height: 50,
                width: 50,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 0.0,
              ),
              child: CustomTextWidget(
                text: "Sign Up",
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                textColor: AppColors.darkBlueColor,
              ),
            ),


            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: CustomTextWidget(
                  text: "First Name:",
                  fontSize: 18.0,
                ),
              ),
            ),
            CustomTextField(
              onInputText: controller.usernameValidation,
              inputType: TextInputType.name,
              inputAction: TextInputAction.next,
              elevation: 0.0,
              textEditingController: controller.userNameTEController,
              focusNode: controller.userNameFocusNode,
              hintText: "First Name",
              prefixIcon: Icons.person_pin_sharp,
            ),
            Obx(
                  ()=> Visibility(
                visible: controller.userNameErrorVisible.value,
                child: Padding(
                  padding: const EdgeInsets.only(top:7),
                  child: Align(alignment:Alignment.topLeft,child: Text(controller.userNameErrorMsg.value,style: const TextStyle(color: AppColors.redColor,fontSize: 12),)),
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: CustomTextWidget(
                  text: "Last Name:",
                  fontSize: 18.0,
                ),
              ),
            ),
            CustomTextField(
              onInputText: controller.lastnameValidation,
              inputType: TextInputType.name,
              inputAction: TextInputAction.next,
              elevation: 0.0,
              textEditingController: controller.lastNameTEController,
              focusNode: controller.lastNameFocusNode,
              hintText: "Last Name",
              prefixIcon: Icons.person_pin_sharp,
            ),
            Obx(
                  ()=> Visibility(
                visible: controller.lastNameErrorVisible.value,
                child: Padding(
                  padding: const EdgeInsets.only(top:7),
                  child: Align(alignment:Alignment.topLeft,child: Text(controller.lastNameErrorMsg.value,style: const TextStyle(color: AppColors.redColor,fontSize: 12),)),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: CustomTextWidget(
                  text: "Father's/Spouse's Name:",
                  fontSize: 18.0,
                ),
              ),
            ),
            CustomTextField(
              onInputText: controller.fsNameValidation,
              inputType: TextInputType.name,
              inputAction: TextInputAction.next,
              elevation: 0.0,
              textEditingController: controller.fsNameTEController,
              focusNode: controller.fsNameFocusNode,
              hintText: "Father's/Spouse's Name",
              prefixIcon: Icons.person_pin_sharp,
            ),
            Obx(
                  ()=> Visibility(
                visible: controller.fsNameErrorVisible.value,
                child: Padding(
                  padding: const EdgeInsets.only(top:7),
                  child: Align(alignment:Alignment.topLeft,child: Text(controller.fsNameErrorMsg.value,style: const TextStyle(color: AppColors.redColor,fontSize: 12),)),
                ),
              ),
            ),
             const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: CustomTextWidget(
                  text: "Email:",
                  fontSize: 18.0,
                ),
              ),
            ),
            CustomTextField(
              hintText: "Email",
              prefixIcon: Icons.email,
              onInputText: controller.emailValidation,
              inputType: TextInputType.emailAddress,
              inputAction: TextInputAction.next,
              elevation: 0.0,
              textEditingController: controller.emailTEController,
              focusNode: controller.emailFocusNode,
            ),
            Obx(
                  ()=> Visibility(
                visible: controller.emailErrorVisible.value,
                child: Padding(
                  padding: const EdgeInsets.only(top:7),
                  child: Align(alignment:Alignment.topLeft,child: Text(controller.emailErrorMsg.value,style: const TextStyle(color: AppColors.redColor,fontSize: 12),)),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: CustomTextWidget(
                  text: "Password:",
                  fontSize: 18.0,
                ),
              ),
            ),
            Obx(
                  ()=> CustomTextField(
                isObscure: controller.obscured.value,
                hintText: "Password",
                prefixIcon: Icons.lock,
                onInputText: controller.passwordValidation,
                suffixIcon: Builder(
                    builder: (context) {
                      return GestureDetector(
                        onTap: (){
                          controller.obscured.value=!controller.obscured.value;
                        },
                        child: Icon(
                          controller.obscured.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: AppColors.darkBlueColor,
                        ),
                      );
                    }
                ),
                inputType: TextInputType.visiblePassword,
                inputAction: TextInputAction.done,
                elevation: 0.0,
                textEditingController: controller.passwordTEController,
                focusNode: controller.passwordFocusNode,
              ),
            ),
            Obx(
                  ()=> Visibility(
                visible: controller.passwordErrorVisible.value,
                child: Padding(
                  padding: const EdgeInsets.only(top:7),
                  child: Align(alignment:Alignment.topLeft,child: Text(controller.passwordErrorMsg.value,style: const TextStyle(color: AppColors.redColor,fontSize: 12),)),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: CustomTextWidget(
                  text: "Confirm Password:",
                  fontSize: 18.0,
                ),
              ),
            ),
            Obx(
                  ()=> CustomTextField(
                isObscure: controller.obscured.value,
                hintText: "Confirm Password",
                prefixIcon: Icons.lock,
                onInputText: controller.confirmPasswordValidation,
                suffixIcon: Builder(
                    builder: (context) {
                      return GestureDetector(
                        onTap: (){
                          controller.obscured.value=!controller.obscured.value;
                        },
                        child: Icon(
                          controller.obscured.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: AppColors.darkBlueColor,
                        ),
                      );
                    }
                ),
                inputType: TextInputType.visiblePassword,
                inputAction: TextInputAction.done,
                elevation: 0.0,
                textEditingController: controller.confirmPasswordTEController,
                focusNode: controller.confirmPasswordFocusNode,
              ),
            ),
            Obx(
                  ()=> Visibility(
                visible: controller.confirmPasswordErrorVisible.value,
                child: Padding(
                  padding: const EdgeInsets.only(top:7),
                  child: Align(alignment:Alignment.topLeft,child: Text(controller.confirmPasswordErrorMsg.value,style: const TextStyle(color: AppColors.redColor,fontSize: 12),)),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: CustomTextWidget(
                  text: "Gender:",
                  fontSize: 18.0,
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(()=> CustomRadioButton(
                    buttonTitle: "Male:",
                    gender: Gender.male,
                    selectedGender: controller.selectedGender.value,
                    onTap: (){
                      controller.selectedGender.value=Gender.male;
                    },
                  ),
                ),
                Obx(()=> CustomRadioButton(
                    buttonTitle: "Female:",
                    gender: Gender.female,
                    selectedGender: controller.selectedGender.value,
                    onTap: (){
                      controller.selectedGender.value=Gender.female;
                    },
                  ),
                ),
                Obx(
                  ()=>CustomRadioButton(
                    buttonTitle: "Other",
                    gender: Gender.other,
                    selectedGender: controller.selectedGender.value,
                    onTap: (){
                      controller.selectedGender.value=Gender.other;
                    },
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(()=> Checkbox(
                  activeColor: AppColors.darkBlueColor,
                    value: controller.isPrivacyPolicy.value,
                    onChanged: (v) {
                      controller.onPrivacyPolicy();
                    },
                  ),
                ),
                const CustomTextWidget(
                  text: "I've read and accept the ",
                  fontSize: 10.0,
                ),
                GestureDetector(
                  onTap: (){},
                  child: const CustomTextWidget(
                    textDecoration: TextDecoration.underline,
                    text: "privacy policy",
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
            Padding(
                padding: const EdgeInsets.only(top: 20.0,bottom: 10.0,),
                child: Obx(()=> controller.isTap.value?const CircularProgressIndicator(color: AppColors.darkBlueColor,):CustomAppButton(
                    buttonText: "Sign Up",
                    onButtonPressed: (){
                      controller.onSignUpTap();
                    },
                  ),
                )
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CustomTextWidget(
                  text: "Already have an account?",
                  fontSize: 12.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0,),
                  child: GestureDetector(
                    onTap: (){
                      Get.back();
                    },
                    child: const CustomTextWidget(
                      text: "Sign In",
                      fontSize: 12.0,
                      textColor: AppColors.lightGreyColor,
                      textDecoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );

  }

}