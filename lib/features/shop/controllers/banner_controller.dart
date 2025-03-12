import 'package:e_commerce/features/shop/models/banner_model.dart';
import 'package:e_commerce/features/utils/popups/loaders.dart';
import 'package:get/get.dart';

class BannerController extends GetxController {
  static BannerController get instance => Get.find();

  //-- variables
  final carouselCurrentIndex = 0.obs;
  final isLoading = false.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;

  //--update page navigational dots

  void updatePageIndicator(index) {
    carouselCurrentIndex.value = index;
  }

  //-- load category data
  Future<void> fetchBanners() async {
    try {
      //-- show loader while loading categories
      // isLoading.value = true;


    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
