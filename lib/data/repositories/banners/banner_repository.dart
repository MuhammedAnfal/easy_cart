import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/features/shop/models/banner_model.dart';
import 'package:e_commerce/features/utils/exceptions/firebase_auth_exception.dart';
import 'package:e_commerce/features/utils/exceptions/firebase_exceptions.dart';
import 'package:e_commerce/features/utils/exceptions/format_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  //-- variables
  final _db = FirebaseFirestore.instance;

  //-- get all order related to the current user
  Future<List<BannerModel>> fetchBanners() async {
    try {
      final result = await _db.collection('banners').where('active', isEqualTo: true).get();
      return result.docs.map((documentSnapshot) => BannerModel.fromMap(documentSnapshot.data())).toList();
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    }  on FormatException catch (e) {
      throw AppFormatException();
    } on PlatformException catch (e) {
      throw AppFirebaseAuthExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong while fetching banners.';
    }
  }

  //-- upload banners to the cloud firestorage
}
