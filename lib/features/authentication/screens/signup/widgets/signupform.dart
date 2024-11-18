import 'package:e_commerce/features/authentication/screens/signup/widgets/privacypolicy.dart';
import 'package:e_commerce/features/authentication/screens/signup/widgets/verify_email.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/device/device_utility.dart';
import '../../login/widgets/formdivider.dart';
import '../../login/widgets/socialbutton.dart';
class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key,});



  @override
  Widget build(BuildContext context) {

    return Form(
        child: Column(
          children: [
            ///-- name

            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: AppTexts.firstName,
                        prefixIcon: Icon(Iconsax.user)),
                  ),
                ),
                const SizedBox(
                  width: AppSizes.spaceBtwInputFields,
                ),
                Expanded(
                  child: TextFormField(
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: AppTexts.lastName,
                        prefixIcon: Icon(Iconsax.user)),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: AppSizes.spaceBtwInputFields,
            ),

            ///-- username
            TextFormField(
              expands: false,
              decoration: const InputDecoration(
                  labelText: AppTexts.username,
                  prefixIcon: Icon(Iconsax.user_edit)),
            ),
            const SizedBox(
              height: AppSizes.spaceBtwInputFields,
            ),

            ///-- email
            TextFormField(
              expands: false,
              decoration: const InputDecoration(
                  labelText: AppTexts.email,
                  prefixIcon: Icon(Iconsax.direct)),
            ),
            const SizedBox(
              height: AppSizes.spaceBtwInputFields,
            ),

            ///-- phone number
            TextFormField(
              expands: false,
              decoration: const InputDecoration(
                  labelText: AppTexts.phoneNo,
                  prefixIcon: Icon(Iconsax.call)),
            ),
            const SizedBox(
              height: AppSizes.spaceBtwInputFields,
            ),

            TextFormField(
              expands: false,
              decoration: const InputDecoration(
                labelText: AppTexts.password,
                prefixIcon: Icon(Iconsax.password_check),
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
            ),
            const SizedBox(
              height: AppSizes.spaceBtwSections,
            ),
            Row(
              children: [
                SizedBox(
                  height: AppDeviceUtility.getScreenHeight() * 0.025,
                  width: AppDeviceUtility.getScreenHeight() * 0.025,
                  child: Checkbox(
                    value: true,
                    onChanged: (value) {},
                  ),
                ),
                const  SizedBox(
                  height: AppSizes.spaceBtwItems,
                ),
                AppPrivacyPolicy(),
              ],
            ),

            const SizedBox(
              height: AppSizes.spaceBtwSections,
            ),

            ///-- signup button

            SizedBox(
              width: double.infinity,child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue
                ),
                onPressed: ()=>Get.to(const VerifyEmailScreen()), child: Text(AppTexts.createAccount,
              style: GoogleFonts.poppins(
                  color: Colors.white
              ),
            )),
            ),

            const SizedBox(
              height: AppSizes.spaceBtwSections,
            ),

            ///-- Divider
            const  FormDevider(dividerText: AppTexts.orSignInwith),

            const SizedBox(
              height: AppSizes.spaceBtwSections,
            ),
            ///Social buttons
            const SocialButton()
          ],
        ));
  }
}

