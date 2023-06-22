import 'package:flutter/material.dart';
import 'package:sport_app/utils/app_colors.dart';
import 'custom_text_widget.dart';
enum Gender{
  male,
  female,
  other,
}
class CustomRadioButton extends StatelessWidget {
  final String buttonTitle;
  final Gender gender;
  final Gender selectedGender;
  final VoidCallback onTap;

  const CustomRadioButton({
    Key? key,
    required this.buttonTitle,
    required this.gender,
    required this.selectedGender,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextWidget(text: buttonTitle),
          Radio<Gender>(
            activeColor: AppColors.darkBlueColor,
            value: gender,
            groupValue: selectedGender,
            onChanged: (value)=>{},
          ),
        ],
      ),
    );
  }
}