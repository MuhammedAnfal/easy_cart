import 'package:e_commerce/common/widgets/loader/animation_loader.dart';
import 'package:e_commerce/features/utils/constants/colors.dart';
import 'package:e_commerce/features/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppFullScreenLoader {
  //-- open full screen loading dialog with a given text and animation
  //-- this method doesnt return anything
  //--parameters
  //--  text : the text to be displayed in loading dialog
  //--  animation: the animation will be shown
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      barrierDismissible: false,
      context: Get.overlayContext!,
      builder: (_) => PopScope(
          canPop: false,
          child: Container(
            color: AppHelperFunction.isDarkMode(Get.context!) ? AppColors.dark : AppColors.white,
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 250),
                  AppAnimationLoaderWidget(text: text, animation: animation),
                ],
              ),
            ),
          )),
    );
  }

  //-- stop currently open loading dialog
  //-- this method doesnt return anything
  static stopLoading() {
    
      // Navigator.pop(Get.context!);
      Navigator.of(Get.overlayContext!).pop();
    
  }
}
