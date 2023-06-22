import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_app/controller/auth_screen_controller/singin_screen_controller.dart';
import 'package:sport_app/utils/app_constant.dart';

import '../../custom_widget/custom_app_button.dart';
import '../../custom_widget/custom_scaffold.dart';
import '../../custom_widget/custom_text_widget.dart';
import '../../custom_widget/custom_textfield.dart';
import '../../utils/app_colors.dart';

class SignInScreen extends GetView<SignInScreenController>{
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
   return CustomScaffold(
   onScreenTap: controller.removeAFieldsFocus,
     child: SingleChildScrollView(
       physics: const BouncingScrollPhysics(),
       child: Column(
         mainAxisSize: MainAxisSize.min,
         mainAxisAlignment: MainAxisAlignment.center,
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
               text: "Sign In",
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
           Padding(
             padding: const EdgeInsets.symmetric(vertical: 10.0),
             child: Align(
               alignment: Alignment.centerRight,
               child: Row(
                 mainAxisSize: MainAxisSize.min,
                 children: [
                   const CustomTextWidget(
                     text: "remember me",
                     fontSize: 14.0,
                   ),
                   Padding(
                     padding: const EdgeInsets.only(left: 5.0,),
                     child: SizedBox(
                       height: 25.0,
                       width: 25.0,
                       child: Obx(()=> Checkbox(
                           activeColor: AppColors.darkBlueColor,
                           value: controller.isRemember.value,
                           onChanged: (v) {
                             controller.isRememberMeTap();
                           },
                         ),
                       ),
                     ),
                   ),
                 ],
               ),
             ),
           ),
           Padding(
               padding: const EdgeInsets.only(top: 20.0,bottom: 10.0,),
               child: Obx(()=> controller.isTap.value?const CircularProgressIndicator(color: AppColors.darkBlueColor,):CustomAppButton(
                   buttonText: "Sign In",
                   onButtonPressed: (){
                     controller.onSignInTap();
                   }
                   ,
                 ),
               )
           ),
           Row(
             mainAxisSize: MainAxisSize.min,
             children: [
               const CustomTextWidget(
                 text: "Don't have an account?",
                 fontSize: 12.0,
               ),
               Padding(
                 padding: const EdgeInsets.only(left: 10.0,),
                 child: GestureDetector(
                   onTap: (){
                     Get.toNamed(kSignupScreen);
                   },
                   child: const CustomTextWidget(
                     text: "Sign Up",
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