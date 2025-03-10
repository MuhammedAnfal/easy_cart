import 'package:e_commerce/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce/features/utils/constants/image_strings.dart';
import 'package:e_commerce/features/utils/network/network_manager.dart';
import 'package:e_commerce/features/utils/popups/full_screen_loader.dart';
import 'package:e_commerce/features/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  //-- variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final controller = Get.put(UserController());

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
  }

  //-- email and password sign in
  Future<void> emailAndPasswordSignIn() async {
    try {
      AppFullScreenLoader.openLoadingDialog('Logging you in....', AppImages.loaderAnimation);

      //-- check the internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        AppFullScreenLoader.stopLoading();
        return;
      }

      //-- form validation
      if (!loginFormKey.currentState!.validate()) {
        AppFullScreenLoader.stopLoading();
        return;
      }

      //-- save the data if the remember me is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      //-- log in user using email and password authentication
      final userCredentials =
          await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      //-- remove loader
      AppFullScreenLoader.stopLoading();

      //-- redirect
      AuthenticationRepository.instance.screenDirect();
    } catch (e) {
      //-- remove loader
      AppFullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  //-- google sing in authentication
  Future<void> googleSignIn() async {
    try {
      await GoogleSignIn().signOut();
      FirebaseAuth.instance.signOut();
      //-- check internet connection
      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        AppFullScreenLoader.stopLoading();
        return;
      }

      //--  google authentication
      final userCredential = await AuthenticationRepository.instance.signInWithGoogle();

      AppFullScreenLoader.openLoadingDialog('Logging you in...', AppImages.loaderAnimation);

      //-- save userRecords
      controller.saveUserRecord(userCredential);

      //-- remove loader
      AppFullScreenLoader.stopLoading();

      AuthenticationRepository.instance.screenDirect();
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
