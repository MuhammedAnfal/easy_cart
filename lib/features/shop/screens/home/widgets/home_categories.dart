import 'package:e_commerce/common/widgets/shimmer/category_shimmer.dart';
import 'package:e_commerce/features/shop/controllers/category_controller.dart';
import 'package:e_commerce/features/shop/screens/sub_category/sub_categories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/image_text_widget/popular_categories_home_screen.dart';

class AppHomeScreenCategories extends StatelessWidget {
  const AppHomeScreenCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());
    return Obx(() {
      if (categoryController.isLoading.value) {
        return const AppCategoryShimmer(itemCount: 5);
      }
      if (categoryController.featuredcategories.isEmpty) {
        return Text(
          'No Data Found!',
          style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),
        );
      }
      return SizedBox(
        height: 80,
        child: ListView.builder(
          itemCount: categoryController.allcategories.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            print(categoryController.featuredcategories.length);
            final category = categoryController.featuredcategories[index];
            print(category.image);
            return AppPopularCategoriesWidget(
              title: category.name.toString(),
              image: category.image,
              ontap: () => Get.to(() => const SubCategoriesScreen()),
            );
          },
        ),
      );
    });
  }
}
