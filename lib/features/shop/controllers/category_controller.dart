import 'package:e_commerce/data/repositories/category/category_repository.dart';
import 'package:e_commerce/features/shop/models/category_model.dart';
import 'package:e_commerce/features/utils/popups/loaders.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  //-- variables
  final categoryRepository = Get.put(CategoryRepository());
  final isLoading = false.obs;
  RxList<CategoryModel> allcategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredcategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchCategories();
  }

  //-- load category data
  Future<void> fetchCategories() async {
    try {
      //-- show loader while loading categories
      isLoading.value = true;

      //-- fetch categories from firebase
      final category = await categoryRepository.getCategories();

      //-- update the category list
      allcategories.assignAll(category);

      //-- filter the featured category

      final featured = category.where((category) => category.isFeatured == true && category.parentId.isEmpty).take(8).toList();
      featuredcategories.assignAll(featured);
 
      allcategories.refresh();
      featuredcategories.refresh();
    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
