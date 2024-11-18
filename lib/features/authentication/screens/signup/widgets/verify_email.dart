import 'package:e_commerce/app.dart';
import 'package:e_commerce/common/styles/success_screen/success_screen.dart';
import 'package:e_commerce/features/authentication/screens/login/login.dart';
import 'package:e_commerce/features/utils/constants/image_strings.dart';
import 'package:e_commerce/features/utils/constants/sizes.dart';
import 'package:e_commerce/features/utils/constants/text_strings.dart';
import 'package:e_commerce/features/utils/helpers/helper_function.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () {
            Get.offAll( const LoginScreen());
          }, icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              /// images
              Image.asset(AppImages.deliveredEmailIllustration,height: AppHelperFunction.screenWidth() * 0.6,),
              const  SizedBox(height: AppSizes.spaceBtwSections,),

              ///-- title and subtitle
              Text(AppTexts.confirmEmail,style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center),
              const SizedBox(height: AppSizes.spaceBtwItems,),
              Text('supporting@gmail.com',style: Theme.of(context).textTheme.labelLarge,textAlign: TextAlign.center),
              const SizedBox(height: AppSizes.spaceBtwItems,),
              Text(AppTexts.confirmEmailSubTitle,style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center),
              const  SizedBox(height: AppSizes.spaceBtwSections,),

              ///-- buttons
              SizedBox(width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue
                ),
                onPressed: () {
                  Get.to(SuccessScreen(image: AppImages.staticSuccessIllustration, title: AppTexts.yourAccuntCreatedTitle, subTitle:AppTexts.yourAccuntCreatedTitleSubTitle, onPressed:()=> Get.to(const LoginScreen())));

                },
               child:const  Text( AppTexts.continueText,
                 style: TextStyle(
                   color: Colors.white
                 ),

               )
              ),
              ),
              const SizedBox(height: AppSizes.spaceBtwItems,),
              SizedBox(width: double.infinity,child: TextButton( onPressed: () {
              }, child: const Text(AppTexts.resendEmail),),)
            ],
          ),
        ),
      ),
    );
  }
}
