import 'package:e_commerce/features/authentication/controllers/contollers.onboarding/onboarding_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/helpers/helper_function.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final darkMode = AppHelperFunction.isDarkMode(context);
    return Positioned(
        right: AppSizes.defaultSpace,
        bottom: AppDeviceUtility.getBottomNavigationBarHeight(),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape:const CircleBorder() ,
              backgroundColor: darkMode ? AppColors.primary : Colors.black),
              onPressed: () {
            OnboardingController.instance.nextPage();
              },
          child: Icon(
              Iconsax.arrow_right_3,
           color: Colors.white,
          ),
        ));
  }
}