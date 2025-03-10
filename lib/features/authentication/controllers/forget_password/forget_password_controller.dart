import 'package:e_commerce/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:e_commerce/features/utils/constants/image_strings.dart';
import 'package:e_commerce/features/utils/network/network_manager.dart';
import 'package:e_commerce/features/utils/popups/full_screen_loader.dart';
import 'package:e_commerce/features/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  //-- variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

//-- send password reset email
  sendPasswordResetEmail() async {
    try {
      //-- start loaing animation
      AppFullScreenLoader.openLoadingDialog('Processing your request', AppImages.loaderAnimation);

      //-- check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        AppFullScreenLoader.stopLoading();
        return;
      }

      //-- check form validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        AppFullScreenLoader.stopLoading();
        return;  
      }

      //-- send email to reset password
      AuthenticationRepository.instance.sendPasswordResetEmail(email.text);

      //-- stop loading animation
      AppFullScreenLoader.stopLoading();

      //-- show success snackbar
      Loaders.successSnackBar(title: 'Email Sent', message: 'Email link sent to Reset your password'.tr);

      //-- redirect to reset password screen
      Get.to(() => ResetPassword(
            email: email.text.trim(),
          ));
    } catch (e) {
      //-- stop loading
      AppFullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }


//-- resend reset password email
  resendPasswordResetEmail(String email) async {
    try {
      //-- start loaing animation
      AppFullScreenLoader.openLoadingDialog('Processing your request', AppImages.loaderAnimation);

      //-- check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        AppFullScreenLoader.stopLoading();
        return;
      }

      //-- send email to reset password
      AuthenticationRepository.instance.sendPasswordResetEmail(email);

      //-- stop loading animation
      AppFullScreenLoader.stopLoading();

      //-- show success snackbar
      Loaders.successSnackBar(title: 'Email Sent', message: 'Email link sent to Reset your password'.tr);
    } catch (e) {
      //-- stop loading
      AppFullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
