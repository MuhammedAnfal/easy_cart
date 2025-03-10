import 'package:e_commerce/features/authentication/controllers/signup/signup_controller.dart';
import 'package:e_commerce/features/authentication/screens/signup/widgets/privacypolicy.dart';
import 'package:e_commerce/features/utils/validators/validations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/device/device_utility.dart';
import '../../login/widgets/formdivider.dart';
import '../../login/widgets/socialbutton.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
        key: controller.singUpFormkey,
        child: Column(
          children: [
            ///-- name
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    validator: (value) => AppValidator.validateEmptyText('First Name', value),
                    controller: controller.firstName,
                    expands: false,
                    decoration: const InputDecoration(labelText: AppTexts.firstName, prefixIcon: Icon(Iconsax.user)),
                  ),
                ),
                const SizedBox(
                  width: AppSizes.spaceBtwInputFields,
                ),
                Expanded(
                  child: TextFormField(
                    validator: (value) => AppValidator.validateEmptyText('Last Name', value),
                    controller: controller.lastName,
                    expands: false,
                    decoration: const InputDecoration(labelText: AppTexts.lastName, prefixIcon: Icon(Iconsax.user)),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: AppSizes.spaceBtwInputFields,
            ),

            ///-- username
            TextFormField(
              validator: (value) => AppValidator.validateEmptyText('User Name', value),
              controller: controller.userName,
              expands: false,
              decoration: const InputDecoration(labelText: AppTexts.username, prefixIcon: Icon(Iconsax.user_edit)),
            ),
            const SizedBox(
              height: AppSizes.spaceBtwInputFields,
            ),

            ///-- email
            TextFormField(
              validator: (value) => AppValidator.validateEmail(value),
              controller: controller.email,
              expands: false,
              decoration: const InputDecoration(labelText: AppTexts.email, prefixIcon: Icon(Iconsax.direct)),
            ),
            const SizedBox(
              height: AppSizes.spaceBtwInputFields,
            ),

            ///-- phone number
            TextFormField(
              validator: (value) => AppValidator.validatePhoneNumber(value),
              controller: controller.phoneNumber,
              expands: false,
              decoration: const InputDecoration(labelText: AppTexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
            ),
            const SizedBox(
              height: AppSizes.spaceBtwInputFields,
            ),

            Obx(
              () => TextFormField(
                validator: (value) => AppValidator.validatePassword(value),
                controller: controller.password,
                expands: false,
                obscureText: controller.hidepassword.value,
                decoration: InputDecoration(
                  labelText: AppTexts.password,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                      onPressed: () {
                        controller.hidepassword.value = !controller.hidepassword.value;
                      },
                      icon: Icon(controller.hidepassword.value ? Iconsax.eye_slash : Iconsax.eye)),
                ),
              ),
            ),
            const SizedBox(
              height: AppSizes.spaceBtwSections,
            ),
            Row(
              children: [
                Obx(
                  () => SizedBox(
                    height: AppDeviceUtility.getScreenHeight() * 0.025,
                    width: AppDeviceUtility.getScreenHeight() * 0.025,
                    child: Checkbox(
                      value: controller.privacyPolicy.value,
                      onChanged: (value) {
                        controller.privacyPolicy.value = !controller.privacyPolicy.value;
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: AppSizes.spaceBtwItems,
                ),
                const AppPrivacyPolicy(),
              ],
            ),

            const SizedBox(
              height: AppSizes.spaceBtwSections,
            ),

            ///-- signup button

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () => controller.signUp(),
                  child: Text(
                    AppTexts.createAccount,
                    style: GoogleFonts.poppins(color: Colors.white),
                  )),
            ),

            const SizedBox(
              height: AppSizes.spaceBtwSections,
            ),

            ///-- Divider
            const FormDevider(dividerText: AppTexts.orSignInwith),

            const SizedBox(
              height: AppSizes.spaceBtwSections,
            ),

            ///Social buttons
            const SocialButton()
          ],
        ));
  }
}
