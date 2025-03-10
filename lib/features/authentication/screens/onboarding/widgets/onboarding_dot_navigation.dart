import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/helpers/helper_function.dart';
import '../../../controllers/onboarding/onboarding_controller.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final darkMode = AppHelperFunction.isDarkMode(context);
    final controller = Get.put(OnboardingController());


    return Positioned(
      left: AppSizes.defaultSpace,
      bottom: AppDeviceUtility.getBottomNavigationBarHeight() + AppDeviceUtility.getScreenHeight() * 0.14 ,
      child: SmoothPageIndicator(
      onDotClicked: controller.dotNavigationClick,
      controller: controller.controller, count:3,
        effect: ExpandingDotsEffect(activeDotColor: darkMode ? AppColors.lightContainer : AppColors.dark,dotHeight:AppDeviceUtility.getScreenHeight() * 0.01),
      ),

    );
  }
}
