import 'package:e_commerce/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce/data/repositories/user/user_repository.dart';
import 'package:e_commerce/features/authentication/models/user_model.dart';
import 'package:e_commerce/features/authentication/screens/login/login.dart';
import 'package:e_commerce/features/personalization/screens/profile/widgets/re_auth_user_login_form.dart';
import 'package:e_commerce/features/utils/constants/image_strings.dart';
import 'package:e_commerce/features/utils/constants/sizes.dart';
import 'package:e_commerce/features/utils/network/network_manager.dart';
import 'package:e_commerce/features/utils/popups/full_screen_loader.dart';
import 'package:e_commerce/features/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  Rx<UserModel> user = UserModel.empty().obs;
  final userRepository = Get.put(UserRepository());
  final profileLoading = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final hidePassword = false.obs;
  final imageUploading = false.obs;
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchUserData();
  }

  //-- get userData
  fetchUserData() async {
    profileLoading.value = true;
    try {
      final users = await userRepository.fetchUserDetails();

      user(users);
      user.refresh();
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  //-- save user record from any register provider
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    //-- refresh user records
    await fetchUserData();
    try {
      if (user.value.id.isEmpty) {
        if (userCredential != null) {
          //-- convert name to first and lastname
          final nameParts = UserModel.nameParts(userCredential.user!.displayName ?? '');
          final userName = UserModel.generateUserName(userCredential.user!.displayName ?? '');

          //mapData
          UserModel userData = UserModel(
              id: userCredential.user!.uid,
              firstName: nameParts[0],
              lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '' ?? '',
              userName: userName,
              email: userCredential.user!.email.toString() ?? '',
              phoneNumber: userCredential.user!.phoneNumber ?? "",
              profilePicture: userCredential.user!.photoURL ?? "");

          //-- save userData
          await UserRepository.instance.saveUserRecord(userData);
        }
      }
    } catch (e) {
      Loaders.warningSnackBar(
        title: 'On Snap!',
        message: 'Something went wrong while saving your infermation, You can re-save your data in your profile.',
      );
    }
  }

  //--Delete account warning
  void deleteAccountWarningPopUp() {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(AppSizes.md),
        title: "Delete Account",
        middleText:
            'Are you sure you want to delete account Permanently? This action is not reversible and all of your data will be removed permanently.',
        confirm: ConstrainedBox(
          constraints: const BoxConstraints(
            maxHeight: 50,
          ),
          child: ElevatedButton(
              onPressed: () async {
                Get.back();
                return deleteUserAccount();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.lg),
                child: Text(
                  'Delete',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              )),
        ),
        cancel: OutlinedButton(onPressed: () => Get.back(), child: const Text('Cancel')));
  }

  //-- delete user account
  void deleteUserAccount() async {
    try {
      //-- reauthenticate user
      final auth = AuthenticationRepository.instance;
      final provider = auth.authUser!.providerData.map((e) => e.providerId).first;
      AppFullScreenLoader.openLoadingDialog('Processing', AppImages.loaderAnimation);

      if (provider.isNotEmpty) {
        if (provider == 'google.com') {
          final result = await Future.wait([
            auth.signInWithGoogle(),
            auth.deleteAccount(),
          ]);
          AppFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          AppFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginForm());
        }
      }
    } catch (e) {
      AppFullScreenLoader.stopLoading();
      Loaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  //-- re-authenticate before deleting
  Future<void> reAuthenticateEmailAndPasswordUser(String email, String password) async {
    try {
      //-- check internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        AppFullScreenLoader.stopLoading();
        return;
      }

      if (!reAuthFormKey.currentState!.validate()) {
        AppFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.reAthenticateWithEmailAndPassword(email, password);
      await AuthenticationRepository.instance.deleteAccount();
      AppFullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      AppFullScreenLoader.stopLoading();
      Loaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  Future uploadProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 70, maxHeight: 512, maxWidth: 512);
      if (image != null) {
        imageUploading.value = true;
        final imageUrl = await userRepository.uploadImage('Users/Images/Profile/', image);
        Map<String, dynamic> json = {'profilePicture': image};
        userRepository.updateSingleField(json);
        user.value.profilePicture = imageUrl;
        user.refresh();
        Loaders.successSnackBar(title: 'Congratulation', message: 'Your profile has been updated');
      }
    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh snap!', message: 'Something Went Wrong: ${e.toString()}');
    } finally {
      imageUploading.value = false;
    }
  }
}
