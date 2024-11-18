import 'package:e_commerce/features/authentication/controllers/contollers.onboarding/onboarding_controller.dart';
import 'package:e_commerce/features/utils/helpers/helper_function.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: AppDeviceUtility.getAppBarHeight(),
      right: AppHelperFunction.screenWidth() * 0.03,
      child: TextButton(
          onPressed: () => OnboardingController.instance.skipPage(),
          child: Text("Skip")),

    );
  }
}
