import 'package:e_commerce/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:e_commerce/features/utils/constants/image_strings.dart';
import 'package:e_commerce/features/utils/constants/sizes.dart';
import 'package:e_commerce/features/utils/constants/text_strings.dart';
import 'package:e_commerce/features/utils/helpers/helper_function.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  String? email;
  VerifyEmailScreen({super.key, this.email});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => AuthenticationRepository.instance.logOut(), icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              /// images
              Image.asset(
                AppImages.deliveredEmailIllustration,
                height: AppHelperFunction.screenWidth() * 0.6,
              ),
              const SizedBox(
                height: AppSizes.spaceBtwSections,
              ),

              ///-- title and subtitle
              Text(AppTexts.confirmEmail, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              const SizedBox(
                height: AppSizes.spaceBtwItems,
              ),
              Text(email ?? '', style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center),
              const SizedBox(
                height: AppSizes.spaceBtwItems,
              ),
              Text(AppTexts.confirmEmailSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
              const SizedBox(
                height: AppSizes.spaceBtwSections,
              ),

              ///-- buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: () => controller.checkTheEmailVerificationStatus(),
                    child: const Text(
                      AppTexts.continueText,
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              const SizedBox(
                height: AppSizes.spaceBtwItems,
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => controller.sendEmailVerification(),
                  child: const Text(AppTexts.resendEmail),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
