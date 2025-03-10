import 'package:e_commerce/features/utils/constants/sizes.dart';
import 'package:e_commerce/features/utils/constants/text_strings.dart';
import 'package:e_commerce/features/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen(
      {super.key, required this.image, required this.title, required this.subTitle, required this.onPressed});
  final String image, title, subTitle;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
      padding: const EdgeInsets.all(AppSizes.appBarHeight * 2),
      child: Column(children: [
        /// Image
        Image(image: AssetImage(image), width: AppHelperFunction.screenHeight() * 0.6),
        const SizedBox(height: AppSizes.spaceBtwSections),

        /// Title & Subtitle
        Text(title, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
        const SizedBox(height: AppSizes.spaceBtwItems),
        Text(subTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
        const SizedBox(height: AppSizes.spaceBtwSections),

        //-- buttons
        SizedBox(width: double.infinity, child: ElevatedButton(onPressed: onPressed, child: const Text(AppTexts.continueText)))
      ]),
    )));
  }
}
