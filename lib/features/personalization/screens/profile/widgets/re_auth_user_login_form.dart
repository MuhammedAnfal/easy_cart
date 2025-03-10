import 'package:e_commerce/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce/features/utils/constants/sizes.dart';
import 'package:e_commerce/features/utils/constants/text_strings.dart';
import 'package:e_commerce/features/utils/validators/validations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Re-Authenticate User'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Form(
              key: controller.reAuthFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: controller.verifyEmail,
                    validator: (value) => AppValidator.validateEmail(value),
                    expands: false,
                    decoration: const InputDecoration(labelText: AppTexts.email, prefixIcon: Icon(Iconsax.direct_right)),
                  ),
                  const SizedBox(height: AppSizes.spaceBtwInputFields),
                  Obx(
                    () => TextFormField(
                      obscureText: controller.hidePassword.value,
                      controller: controller.verifyPassword,
                      validator: (value) => AppValidator.validateEmptyText('Password', value),
                      expands: false,
                      decoration: InputDecoration(
                          labelText: AppTexts.lastName,
                          prefixIcon: const Icon(Iconsax.password_check),
                          suffixIcon: IconButton(
                              onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                              icon: const Icon(Iconsax.eye_slash))),
                    ),
                  ),
                  const SizedBox(height: AppSizes.spaceBtwSections),

                  //-- log in button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => controller.reAuthenticateEmailAndPasswordUser(
                          controller.verifyEmail.value.text, controller.verifyPassword.value.text),
                      child: const Text('verify'),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
