import 'package:e_commerce/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:e_commerce/features/utils/constants/sizes.dart';
import 'package:e_commerce/features/utils/validators/validations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/text_strings.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///-- Heading
            Text(AppTexts.forgetPasswordTitle, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
            const SizedBox(height: AppSizes.spaceBtwItems),
            Text(AppTexts.forgetPasswordSubTitle, style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center),
            const SizedBox(height: AppSizes.spaceBtwSections * 2),

            ///-- text field
            Form(
              key: controller.forgetPasswordFormKey,
              child: TextFormField(
                controller: controller.email,
                validator: (value) => AppValidator.validateEmail(value),
                decoration: const InputDecoration(labelText: AppTexts.email, prefixIcon: Icon(Iconsax.direct_right)),
              ),
            ),
            const SizedBox(
              height: AppSizes.spaceBtwSections,
            ),

            ///-- submit button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () => controller.sendPasswordResetEmail(),
                child: const Text(
                  AppTexts.submit,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
