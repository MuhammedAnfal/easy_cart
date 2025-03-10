import 'package:e_commerce/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce/data/repositories/user/user_repository.dart';
import 'package:e_commerce/features/authentication/models/user_model.dart';
import 'package:e_commerce/features/authentication/screens/signup/widgets/verify_email.dart';
import 'package:e_commerce/features/utils/constants/image_strings.dart';
import 'package:e_commerce/features/utils/network/network_manager.dart';
import 'package:e_commerce/features/utils/popups/full_screen_loader.dart';
import 'package:e_commerce/features/utils/popups/loaders.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();
  SignupController();

//-- variables
  final hidepassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> singUpFormkey = GlobalKey();

//-- sigup
  Future<void> signUp() async {
    try {
      // Check Internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        return;
      }

      // Form validation
      if (!singUpFormkey.currentState!.validate()) {
        return;
      }

      // Privacy policy check
      if (!privacyPolicy.value) {
        Loaders.warningSnackBar(
            title: 'Accept Privacy Policy', message: 'You must accept the Privacy Policy and Terms of Use to create an account.');
        return;
      }

      // Start loading
      AppFullScreenLoader.openLoadingDialog(
        'We are processing your information',
        AppImages.loaderAnimation,
      );

      // Register user
      final userCredential =
          await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Save user data
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        userName: userName.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // Show success message
      Loaders.successSnackBar(title: 'Congratulations', message: 'Your account has been created! Verify your email to continue.');

      // Navigate to verify email screen
      AppFullScreenLoader.stopLoading();
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      Loaders.errorSnackBar(title: 'Error', message: 'Something went wrong: ${e.toString()}');
    }
  }
}
