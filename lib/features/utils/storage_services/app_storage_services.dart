import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AppStorageServices extends GetxController {
  static AppStorageServices get instance => Get.find();
  final firebaseStorage = FirebaseStorage.instance;

  //-- upload local asset from ide
  //-- return Uint8List containing image Data

  Future<Uint8List> getImageDataFromAsset(String path) async {
    try {
      final byteData = await rootBundle.load(path);
      final imageData = byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
      return imageData;
    } catch (e) {
      // handle exception grcefully
      throw 'Error In Loading Imgae Data:$e';
    }
  }

  //-- upload image using imagedata on cloud firebase storage
  //-- return the download url  of the uploaded image
  Future<String> uploadImageData(String path, Uint8List image, String name) async {
    try {
      final ref = firebaseStorage.ref(path).child(name);
      await ref.putData(image);
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      if (e is FirebaseException) {
        throw 'Firebase Exception: ${e.message}';
      }
      if (e is SocketException) {
        throw 'Network Error: ${e.message}';
      }
      if (e is PlatformException) {
        throw 'Platform Exception:${e.message}';
      }
      throw 'Something Went Wrong,Please Try Again';
    }
  }

  //-- upload image on Cloud firebase Storage
  //-- return the download url from the uploaded image
  Future<String> uploadImageFile(String path, XFile image) async {
    try {
      final ref = firebaseStorage.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      if (e is FirebaseException) {
        throw 'Firebase Exception: ${e.message}';
      }
      if (e is SocketException) {
        throw 'Network Error: ${e.message}';
      }
      if (e is PlatformException) {
        throw 'Platform Exception:${e.message}';
      }
      throw 'Something Went Wrong,Please Try Again';
    }
  }
}
