import 'package:e_commerce/features/authentication/controllers/contollers.onboarding/onboarding_controller.dart';
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
      right: AppSizes.appBarHeight,
      child: TextButton(
          onPressed: () => OnboardingController.instance.skipPage(),
          child: Text("Skip")),

    );
  }
}
