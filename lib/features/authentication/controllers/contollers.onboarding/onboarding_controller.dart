import 'package:e_commerce/features/authentication/screens/login/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController   {
  static OnboardingController get instance => Get.find();

  /// variables
     final controller = PageController();
     Rx<int> currentPageIndex = 0.obs;
  /// update current index when page scroll
  void updatePageIndicator(index){
    currentPageIndex = index;
  }

  /// jump to the specific dot selected page
  void dotNavigationClick(index){
    currentPageIndex.value = index;
    controller.jumpToPage(index);
  }

  /// update the current index and jump to the next page
  void nextPage(){
    if(currentPageIndex == 2){
      Get.offAll( const LoginScreen());

    }else{
      currentPageIndex.value = currentPageIndex.value +1;
      controller.jumpToPage(currentPageIndex.value );
    }
  }

  /// update the current index and jump to the last page
  void skipPage(){
    currentPageIndex.value = 2;
    controller.jumpToPage(2);
  }

}