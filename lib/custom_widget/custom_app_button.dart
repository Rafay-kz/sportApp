import 'package:flutter/material.dart';
import 'package:sport_app/utils/app_colors.dart';

class CustomAppButton extends StatelessWidget {
  final String buttonText;
  final Color textColor;
  final VoidCallback onButtonPressed;
  final double? height;
  final double? width;
  final Color buttonColor;
  const CustomAppButton({Key? key, this.height, this.width,this.buttonColor = AppColors.darkBlueColor, required this.buttonText, this.textColor=AppColors.whiteColor, required this.onButtonPressed,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10.0,),
      onTap: onButtonPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(10.0,),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 7.5,
          horizontal: 15.0,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              buttonText,
              style: TextStyle(color: textColor),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}