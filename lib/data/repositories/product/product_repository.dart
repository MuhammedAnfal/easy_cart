import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/features/utils/exceptions/firebase_exceptions.dart';
import 'package:e_commerce/features/utils/exceptions/platform_exceptions.dart';
import 'package:e_commerce/features/utils/storage_services/app_storage_services.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProductRepository extends GetxController{
 static ProductRepository get instance => Get.find();


 //-- firestore interaction
 final _db = FirebaseFirestore.instance;


 //-- get limited featured product
 Future <List<ProductModel>> getFeaturedProducts()async{
   try{
     final products = await _db.collection('Products').where('isFeatured',isEqualTo: true).limit(2).get();
     return products.docs.map((e) => ProductModel.fromMap(e.data()),).toList();

   }on FirebaseException catch(e){
   throw AppFirebaseException(e.toString());
   }on PlatformException catch(e){
     throw AppPlatformException(e.toString());
   }catch(e){
     throw 'Oh Snap! Something Went Wrong';
   }
 }


//-- upload dummy data to the cloud firestore
Future<void> uploadDummyData(List<ProductModel> products)async{
  try{

    //-- upload all products to firestore with image
    final storage = Get.put(AppStorageServices());

    //-- loop through each product
    for (var product in products) {

      //-- get image data from assets
      final thumbnail =  await storage.getImageDataFromAsset(product.thumbnail);

      //-- upload image and gets its url
      final url = await storage.uploadImageData('Products/Images', thumbnail, product.thumbnail.toString());

      //-- assign url to thumbnail attribute
      product.thumbnail = url;

      //-- product list of images
      if(product.images != null && product.images!.isNotEmpty){
        List<String> imageUrl = [];
        for(var image in product.images!){

          //-- get image data from assets
          final imageData = await storage.getImageDataFromAsset(image);

          //-- upload image and gets its url
          final url = await storage.uploadImageData('Products/Images', imageData, image.toString());

          //-- assign url to thumbnail attribute
          imageUrl.add(url);

          product.images?.clear();
        }

      }
    }

  }catch(e){

  }
}

}