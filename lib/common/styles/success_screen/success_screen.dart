import 'package:e_commerce/common/styles/spacing_styles.dart';
import 'package:e_commerce/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce/features/utils/constants/sizes.dart';
import 'package:e_commerce/features/utils/constants/text_strings.dart';
import 'package:e_commerce/features/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.image, required this.title, required this.subTitle, required this.onPressed});

  final String image, title, subTitle;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: AppSpacingStlyes.paddingWithAppBarHeight * 2,
        child: Column(
          children: [
            ///--  image
            Image.asset(image),
            SizedBox(
              height: AppSizes.spaceBtwSections,
              width: AppHelperFunction.screenWidth() * 0.6,
            ),
            const SizedBox(height: AppSizes.spaceBtwSections),

            ///-- title and subtitle
            Text(AppTexts.yourAccuntCreatedTitle, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
            const SizedBox(height: AppSizes.spaceBtwItems),
            Text('supporting@gmail.com', style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center),
            const SizedBox(height: AppSizes.spaceBtwItems),
            Text(AppTexts.yourAccuntCreatedTitleSubTitle,
                style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
            const SizedBox(height: AppSizes.spaceBtwSections),

            ///-- button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () => AuthenticationRepository.instance.screenDirect(),
                  child: const Text(
                    AppTexts.continueText,
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
