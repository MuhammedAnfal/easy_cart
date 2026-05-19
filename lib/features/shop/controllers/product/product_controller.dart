import 'package:e_commerce/data/repositories/product/product_repository.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/features/utils/constants/enums.dart';
import 'package:e_commerce/features/utils/popups/loaders.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();


  //--variables
  final isLoading = false.obs;
  RxList<ProductModel>  featuredProduct = <ProductModel>[].obs;
  final productRepository = Get.put(ProductRepository());


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

  }

  void fetchFeaturedProduct ()async{
    try{
      //-- make loading is true while fetch started
      isLoading.value = true;

     //-- fetching products
      final products = await productRepository.getFeaturedProducts();

      //-- assign products
      featuredProduct.assignAll(products);

    }catch(
    e
    ){
      Loaders.errorSnackBar(title: 'Oh Snap!',message:e.toString());

    }finally{

  }
  }

  String getProductPrice(ProductModel product){
  double smallestPrice = double.infinity;
  double largestPrice = 0.0;

  //-- if no variation exist, return the price
    if(product.productType == ProductType.single.toString()){
     return (product.salesPrice > 0? product.salesPrice :product.price).toString();
    }else{
      //-- calculate smallest and largets price among variation
      for(var variation in product.productVariations!){

        //-- determine the price to consider (sale price if available, other wise regular price )
        double   priceToConsider = variation.salePrice > 0 ? variation.salePrice : variation.price;

        //-- update smallest and largest price
        if(priceToConsider < smallestPrice){
          smallestPrice = priceToConsider;
        }

        if(priceToConsider < largestPrice){
          largestPrice = priceToConsider;
        }
      }
      if(smallestPrice.isEqual(largestPrice)){
        return largestPrice.toString();
      }else{
        //-- otherwise return a price range
        return '$smallestPrice - $largestPrice';
      }
    }
  }

  //-- calculate discount percentage
 String? calculateSalesPercentage(double originalPrice ,double? salePrice){
    if(salePrice==null||salePrice<=0.0)return null;
    if(originalPrice <= 0)return null;

    double percentage = ((originalPrice - salePrice) / originalPrice * 100);
    return percentage.toStringAsFixed(0);
 }

 //-- get stock status
String getStockStatus(int stock){
    return stock > 0 ? 'In Stock' : 'Out of Stock';
}

// Future<void> uploadProducts() {
//     isLoading.value = false;
//
//
// }
}