import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce/features/authentication/models/user_model.dart';
import 'package:e_commerce/features/utils/exceptions/firebase_auth_exception.dart';
import 'package:e_commerce/features/utils/exceptions/firebase_exceptions.dart';
import 'package:e_commerce/features/utils/exceptions/format_exceptions.dart';
import 'package:e_commerce/features/utils/exceptions/platform_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  //-- functio to save userdata to firestore
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection('users').doc(user.id).set(user.toJson());
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.toString()).message.toString();
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } on FormatException {
      throw const AppFormatException();
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  //-- function to fetch userdetails based on userid
  Future<UserModel> fetchUserDetails() async {
    try {
      final userData = await _db.collection('users').doc(AuthenticationRepository.instance.authUser?.uid).get();
      if (userData.exists) {
        return UserModel.fromJson(userData.data() as Map<String, dynamic>);
      } else {
        return UserModel.empty();
      }
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.toString()).message.toString();
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } on FormatException {
      throw const AppFormatException();
    } catch (e) {
   
      throw 'Something went wrong, Please try again';
    }
  }

  //-- function to update userData
  Future updateUserDetails(UserModel updateUser) async {
    try {
      return _db.collection('users').doc(updateUser.id).update(updateUser.toJson());
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.toString()).message.toString();
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } on FormatException {
      throw const AppFormatException();
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  //-- update single field of user
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db.collection('users').doc(AuthenticationRepository.instance.authUser?.uid).update(json);
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.toString()).message.toString();
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } on FormatException {
      throw const AppFormatException();
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  //-- delete the user
  Future<void> removeUserRecord(String userId) async {
    try {
      final userData = await _db.collection('users').doc(userId).delete();
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.toString()).message.toString();
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } on FormatException {
      throw const AppFormatException().message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  Future<String> uploadImage(String path, XFile file) async {
    try {
      final ref = FirebaseStorage.instance.ref(path).child(file.name);
      await ref.putFile(File(file.path));
      final downloadUrl = await ref.getDownloadURL();
      return downloadUrl; 
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.toString()).message.toString();
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } on FormatException {
      throw const AppFormatException().message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }
}
