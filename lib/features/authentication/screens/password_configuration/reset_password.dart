import 'package:e_commerce/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:e_commerce/features/authentication/screens/login/login.dart';
import 'package:e_commerce/features/utils/constants/image_strings.dart';
import 'package:e_commerce/features/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/text_strings.dart';
import '../../../utils/helpers/helper_function.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Get.off(const LoginScreen());
              },
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              ///--  image
              Image.asset(AppImages.deliveredEmailIllustration),
              SizedBox(
                height: AppSizes.spaceBtwSections,
                width: AppHelperFunction.screenWidth() * 0.6,
              ),
              const SizedBox(height: AppSizes.spaceBtwSections),

              ///-- title and subtitle
              Text(email, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              const SizedBox(height: AppSizes.spaceBtwItems),
              Text(AppTexts.changeYourPasswordSubTitle,
                  style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
              const SizedBox(height: AppSizes.spaceBtwSections),

              ///-- button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: () => Get.offAll(() => const LoginScreen()),
                    child: const Text(
                      AppTexts.done,
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              const SizedBox(height: AppSizes.spaceBtwItems),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(side: BorderSide.none),
                    onPressed: () => ForgetPasswordController.instance.resendPasswordResetEmail(email.trim() ),
                    child: const Text(
                      AppTexts.resendEmail,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
