import 'package:e_commerce/data/repositories/user/user_repository.dart';
import 'package:e_commerce/features/authentication/screens/login/login.dart';
import 'package:e_commerce/features/authentication/screens/onboarding/onboarding.dart';
import 'package:e_commerce/features/authentication/screens/signup/widgets/verify_email.dart';
import 'package:e_commerce/features/utils/exceptions/firebase_auth_exception.dart';
import 'package:e_commerce/features/utils/exceptions/firebase_exceptions.dart';
import 'package:e_commerce/features/utils/exceptions/format_exceptions.dart';
import 'package:e_commerce/features/utils/exceptions/platform_exceptions.dart';
import 'package:e_commerce/navigation_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();
  //-- variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  User? get authUser => _auth.currentUser;

  //-- called from main.dart on app launch\
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenDirect();
  }

  //-- function to show relevant screen
  Future<void> screenDirect() async {
    //-- check the user email verified if he logined
    User? user = _auth.currentUser;
    

    if (user != null) {
      if (user.emailVerified) {
        return Get.offAll(() => const NavigationMenu());
      } else {
        return Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
      //-- local Storage

      deviceStorage.writeIfNull('isFirstTime', true);
      deviceStorage.read('isFirstTime') != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(() => const OnBoardingScreen());
    }
  }

/*----------------------email and password sign in-----------------*/
  //-- email authentication (sign in)

  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.toString()).message.toString();
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } on FormatException {
      throw const AppFormatException();
    } catch (e) {
      throw 'Something went wrong, Please try againg';
    }
  }

  //-- eamil auhtentication (register)
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.toString()).message.toString();
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } on FormatException {
      throw const AppFormatException();
    } catch (e) {
      throw 'Something went wrong, Please try againg';
    }
  }

  //-- send email verification
  Future<void> sendEmailVerification() async {
    try {
      return _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.toString()).message.toString();
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } on FormatException {
      throw const AppFormatException();
    } catch (e) {
      throw 'Something went wrong, Please try againg';
    }
  }

  //-- reauthenticate user [reauthentication]
  Future<void> reAthenticateWithEmailAndPassword(String email, String password) async {
    try {
      //-- create credential
      AuthCredential credential = EmailAuthProvider.credential(email: email, password: password);

      //-- reAutheticate
      await _auth.currentUser!.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.toString()).message.toString();
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } on FormatException {
      throw const AppFormatException();
    } catch (e) {
      throw 'Something went wrong, Please try againg';
    }
  }

  //-- forget password [email authentication]
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.toString()).message.toString();
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } on FormatException {
      throw const AppFormatException();
    } catch (e) {
      throw 'Something went wrong, Please try againg';
    }
  }

  /*------------------federated identity & social sign in----------------*/

  //-- google [google authentication]
  Future<UserCredential?> signInWithGoogle() async {
    try {
      //-- trigger the authentication flow(the popup)
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

     

      //-- obtaine auth details from userAccount
      final GoogleSignInAuthentication? googleAuth = await userAccount?.authentication;
 

      //-- create new credentials
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
     

      //-- once sing in return the usercredential
      return _auth.signInWithCredential(credential);
     
    } on FirebaseAuthException catch (e) {
      throw e.toString();
    } on FirebaseException catch (e) {
      throw e.toString();
    } on PlatformException catch (e) {
      throw e.toString();
    } on FormatException catch (e) {
      throw e.toString();
    } catch (e) {
      print(e.toString());
      if (kDebugMode) print('something went wrong${e.toString()}');
      return null;
    }
  }

  //-- facebook [facebook authentication]
  /*------------------end federated identity & social sign in----------------*/

  //-- valid for any authentication [logout user]
  Future<void> logOut() async {
    try {
      await GoogleSignIn().signOut();
      _auth.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw e.toString();
    } on FirebaseException catch (e) {
      throw e.toString();
    } on PlatformException catch (e) {
      throw e.toString();
    } on FormatException catch (e) {
      throw e.toString();
    }
  }

  //-- remove user authe and firestore user account [delete user]
  Future<void> deleteAccount() async {
    try {
      await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.toString()).message.toString();
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } on FormatException {
      throw const AppFormatException();
    } catch (e) {
      throw 'Something went wrong, Please try againg';
    }
  }
}
