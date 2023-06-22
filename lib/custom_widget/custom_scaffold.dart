import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class CustomScaffold extends StatelessWidget {
  final Function? onScreenTap;
  final Widget child;
  const CustomScaffold({Key? key, this.onScreenTap, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(onScreenTap!=null){
          onScreenTap!();
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SafeArea(
          bottom: false,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 30.0,
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(20.0,),
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.lightBlackColor,
                      offset: Offset(0, 6),
                      blurRadius: 6,
                    ),
                  ],
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 15.0,
                  horizontal: 10.0,
                ),
                child: child,
              ),
            ),
          ),
        ),
      ),
    );  }
}