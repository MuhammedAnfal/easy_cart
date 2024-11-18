import 'package:e_commerce/features/authentication/controllers/contollers.onboarding/onboarding_controller.dart';
import 'package:e_commerce/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:e_commerce/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:e_commerce/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:e_commerce/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:e_commerce/features/utils/constants/image_strings.dart';
import 'package:e_commerce/features/utils/constants/text_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());
    return Scaffold(
      body: Stack(
        children: [

          // horizontal scrollbar page
          PageView(
            onPageChanged: controller.currentPageIndex,
            controller: controller.controller,
            children: const [
              OnBoardingPage(title: AppTexts.onBoardingTitle,image:AppImages.onBoardingimage ,subTitle:AppTexts.onBoardingSubTitle),
              OnBoardingPage(title: AppTexts.onBoardingTitle2,image:AppImages.onBoardingimage1 ,subTitle:AppTexts.onBoardingSubTitle2),
              OnBoardingPage(title: AppTexts.onBoardingTitle3,image:AppImages.onBoardingimage2 ,subTitle:AppTexts.onBoardingSubTitle3),
            ],
          ),

          // skip button
          const OnBoardingSkip(),

          // dot navigation  smooth page indicator
          const OnBoardingDotNavigation(),

          // circular button
           const OnBoardingNextButton()
         ],
      ),
    );
  }
}





