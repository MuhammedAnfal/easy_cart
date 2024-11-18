import 'package:e_commerce/features/authentication/screens/login/login.dart';
import 'package:e_commerce/features/utils/constants/image_strings.dart';
import 'package:e_commerce/features/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../utils/constants/text_strings.dart';
import '../../../utils/helpers/helper_function.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () {
            Get.off(const LoginScreen());
          } , icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              ///--  image
              Image.asset(AppImages.deliveredEmailIllustration),
              SizedBox(height: AppSizes.spaceBtwSections,width: AppHelperFunction.screenWidth() * 0.6,),
              const SizedBox(height: AppSizes.spaceBtwSections),

              ///-- title and subtitle
              Text(AppTexts.changeYourPasswordTitle,style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center),
              const SizedBox(height: AppSizes.spaceBtwItems),
              Text(AppTexts.changeYourPasswordSubTitle,style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center),
              const SizedBox(height: AppSizes.spaceBtwSections),

              ///-- button
              SizedBox(width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue
                    ),
                    onPressed: () {},
                    child:const  Text( AppTexts.done,
                      style: TextStyle(
                          color: Colors.white
                      ),

                    )
                ),
              ),
              const SizedBox(height: AppSizes.spaceBtwItems),

              SizedBox(width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    side: BorderSide.none
                  ),
                    onPressed: () {},
                    child:const  Text( AppTexts.resendEmail,)
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
