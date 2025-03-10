import 'dart:async';

import 'package:e_commerce/data/repositories/user/user_repository.dart';
import 'package:e_commerce/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce/features/utils/constants/image_strings.dart';
import 'package:e_commerce/features/utils/network/network_manager.dart';
import 'package:e_commerce/features/utils/popups/full_screen_loader.dart';
import 'package:e_commerce/features/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initializeNames();
  }

  //-- fetch user record
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      //-- start animation
      AppFullScreenLoader.openLoadingDialog('We are updating your infermation', AppImages.loaderAnimation);

      //-- check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        AppFullScreenLoader.stopLoading();
      }

      //-- update users firstname and last name in firebase firestore
      Map<String, dynamic> name = {'firstName': firstName.text.trim(), 'lastName': lastName.text.trim()};
      userRepository.updateSingleField(name);

      //-- getting updated userData to the user or the ui will not be updated
      userController.user.value = await userRepository.fetchUserDetails();

      //-- stop loading
      AppFullScreenLoader.stopLoading();

      //-- returning to profile screen because if Get.off created duplicate of profilescreen
      Get.back();

      //-- show success snackbar
      Loaders.successSnackBar(title: 'Congratulation', message: 'Your name has been updated');
    } catch (e) {
      AppFullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
