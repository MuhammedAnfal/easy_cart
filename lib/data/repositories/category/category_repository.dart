import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/features/shop/models/category_model.dart';
import 'package:e_commerce/features/utils/constants/firebase_constants.dart';
import 'package:e_commerce/features/utils/exceptions/firebase_exceptions.dart';
import 'package:e_commerce/features/utils/exceptions/platform_exceptions.dart';
import 'package:e_commerce/features/utils/storage_services/app_storage_services.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  //-- variables
  final db = FirebaseFirestore.instance;

  //-- get all categories
  Future<List<CategoryModel>> getCategories() async {
    try {
      final snapshot = await db.collection(FirebaseConstants.categories).get();

      return snapshot.docs.map((e) => CategoryModel.fromJson(e)).toList();
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw 'Something Went Wrong,Please try againg';
    }
  }

  //-- upload categories to the cloud firebase
  Future<void> uploadDummyData(List<CategoryModel> categories) async {
    try {
      final storage = Get.put(AppStorageServices());

      //-- loop through each category
      for (var category in categories) {
        
        //-- get imagedata link from the local asset
        final file = await storage.getImageDataFromAsset(category.image);

        //-- upload image and gets its url
        final url = await storage.uploadImageData('Categories', file, category.name);

        category.image = url;

        //-- storage category in firestore
        await db.collection('categories').doc(category.id).set(category.toJson());
      }
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw 'Something Went Wrong, Please Try Again';
    }
  }
}
