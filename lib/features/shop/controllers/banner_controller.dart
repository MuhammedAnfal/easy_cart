import 'package:e_commerce/features/utils/popups/loaders.dart';
import 'package:get/get.dart';

class BannerController extends GetxController {
  static BannerController get instance => Get.find();

  //-- variables
  final carouselCurrentIndex = 0.obs;
  final isLoading = false.obs;

  //--update page navigational dots

  void updatePageIndicator(index) {
    carouselCurrentIndex.value = index;
  }

  //-- load category data
  Future<void> fetchBanners() async {
    try {
      // //-- show loader while loading categories
      // isLoading.value = true;

      // //-- fetch categories from firebase
      // final category = await categoryRepository.getCategories();

      // //-- update the category list
      // allcategories.assignAll(category);

      // //-- filter the featured category

      // final featured = category.where((category) => category.isFeatured == true && category.parentId.isEmpty).take(8).toList();
      // featuredcategories.assignAll(featured);

      // allcategories.refresh();
      // featuredcategories.refresh();
    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
