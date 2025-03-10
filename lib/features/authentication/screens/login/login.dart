import 'package:e_commerce/common/styles/spacing_styles.dart';
import 'package:e_commerce/features/authentication/controllers/login/login_controller.dart';
import 'package:e_commerce/features/authentication/screens/login/widgets/formdivider.dart';
import 'package:e_commerce/features/authentication/screens/login/widgets/socialbutton.dart';
import 'package:e_commerce/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:e_commerce/features/authentication/screens/signup/signup.dart';
import 'package:e_commerce/features/utils/constants/colors.dart';
import 'package:e_commerce/features/utils/constants/image_strings.dart';
import 'package:e_commerce/features/utils/constants/sizes.dart';
import 'package:e_commerce/features/utils/constants/text_strings.dart';
import 'package:e_commerce/features/utils/device/device_utility.dart';
import 'package:e_commerce/features/utils/helpers/helper_function.dart';
import 'package:e_commerce/features/utils/validators/validations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    final darkMode = AppHelperFunction.isDarkMode(context);
    return Scaffold(
      body: Form(
        key: controller.loginFormKey,
        child: Padding(
          padding: AppSpacingStlyes.paddingWithAppBarHeight,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppDeviceUtility.getScreenHeight() * 0.035),
                          boxShadow: darkMode
                              ? []
                              : [
                                  BoxShadow(
                                    offset: const Offset(0, 0.8),
                                    blurRadius: 20,
                                    spreadRadius: 10,
                                    color: AppColors.grey.withOpacity(0.9),
                                    // blurStyle: BlurStyle.outer
                                  )
                                ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(AppDeviceUtility.getScreenHeight() * 0.035),
                              child: Image.asset(
                                height: AppDeviceUtility.getScreenHeight() * 0.23,
                                darkMode ? AppImages.lightAppLogo : AppImages.darkAppLogo,
                              ),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: AppDeviceUtility.getScreenHeight() * 0.02,
                    ),
                    Text(
                      AppTexts.loginTitle,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: AppSizes.sm),
                    Padding(
                      padding: EdgeInsets.only(left: AppDeviceUtility.getScreenHeight() * 0.027),
                      child: Text(AppTexts.loginSubTitle, style: Theme.of(context).textTheme.bodyMedium),
                    ),
                  ],
                ),
                //-- Form
                Form(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: AppSizes.spaceBtwSections),
                    child: Column(
                      children: [
                        SizedBox(
                          width: AppDeviceUtility.getScreenHeight() * 0.5,
                          child: TextFormField(
                            validator: (value) => AppValidator.validateEmail(value),
                            controller: controller.email,
                            expands: false,
                            decoration: const InputDecoration(labelText: AppTexts.email, prefixIcon: Icon(Iconsax.direct_right)),
                          ),
                        ),
                        const SizedBox(
                          height: AppSizes.spaceBtwInputFields,
                        ),
                        Obx(
                          () => SizedBox(
                            width: AppDeviceUtility.getScreenHeight() * 0.5,
                            child: TextFormField(
                              validator: (value) => AppValidator.validateEmptyText('password ', value),
                              controller: controller.password,
                              obscureText: controller.hidePassword.value,
                              expands: false,
                              decoration: InputDecoration(
                                  labelText: AppTexts.password,
                                  prefixIcon: const Icon(Iconsax.password_check),
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        controller.hidePassword.value = !controller.hidePassword.value;
                                      },
                                      icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye))),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: AppSizes.spaceBtwInputFields / 2,
                        ),

                        ///-- remember me & forgot password
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              child: Row(
                                children: [
                                  Obx(
                                    () => Checkbox(
                                      value: controller.rememberMe.value,
                                      onChanged: (value) {
                                        controller.rememberMe.value = !controller.rememberMe.value;
                                      },
                                    ),
                                  ),
                                  const Text(AppTexts.rememberMe),
                                ],
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  Get.to(const ForgetPassword());
                                },
                                child: const Text(AppTexts.forgetPassword))
                          ],
                        ),
                        const SizedBox(
                          height: AppSizes.spaceBtwSections,
                        ),

                        ///-- sign in button
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(backgroundColor: Colors.blue),
                              onPressed: () => controller.emailAndPasswordSignIn(),
                              child: const Text(
                                AppTexts.signIn,
                              )),
                        ),

                        const SizedBox(
                          height: AppSizes.spaceBtwItems,
                        ),

                        //create account button
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(side: const BorderSide(color: Colors.grey)),
                              onPressed: () {
                                Get.to(() => const SignupScreen());
                              },
                              child: const Text(AppTexts.createAccount)),
                        )
                      ],
                    ),
                  ),
                ),
                const FormDevider(
                  dividerText: AppTexts.orSignInwith,
                ),
                const SizedBox(
                  height: AppSizes.spaceBtwItems,
                ),

                const SocialButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
