import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/appbar/tabbar.dart';
import 'package:e_commerce/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:e_commerce/common/widgets/layOut/grid_layout.dart';
import 'package:e_commerce/common/widgets/products/products/cart/cart_menu_icon.dart';
import 'package:e_commerce/common/widgets/store/app_brand_card.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/features/shop/controllers/category_controller.dart';
import 'package:e_commerce/features/shop/screens/brand/all_brands.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/app_category_tab.dart';
import 'package:e_commerce/features/utils/constants/colors.dart';
import 'package:e_commerce/features/utils/constants/sizes.dart';
import 'package:e_commerce/features/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = CategoryController.instance.featuredcategories;
    final dark = AppHelperFunction.isDarkMode(context);
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: AppsAppBar(
          title: const Text('Store'),
          actions: [
            AppCartCenterIcon(
              onPressed: () {},
            ),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                automaticallyImplyLeading: false,
                floating: true,
                backgroundColor: dark ? AppColors.black : AppColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(AppSizes.md),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      const SizedBox(
                        height: AppSizes.spaceBtwItems,
                      ),
                      //-- search bar
                      const AppHomeSearchWidget(
                        text: 'Search in store',
                        padding: EdgeInsets.zero,
                      ),

                      const SizedBox(
                        height: AppSizes.spaceBtwSections,
                      ),

                      //-- featured brands
                      AppSectionHeading(
                        title: 'Featured Brands',
                        onPressed: () => Get.to(const AllBrandsScreen()),
                      ),
                      const SizedBox(
                        height: AppSizes.spaceBtwItems / 1.5,
                      ),
                      AppGridLayout(
                          mainAxisExtend: 80,
                          itemCount: 4,
                          itemBuilder: (_, index) {
                            return const AppBrandCard(showBorder: true);
                          })
                    ],
                  ),
                ),
                bottom: AppTabBar(
                  tabs: categories.map((element) => Tab(child: Text(element.name))).toList(),
                ),
              )
            ];
          },
          body: TabBarView(
              children: categories
                  .map(
                    (element) => AppCategoryTab(categories: categories),
                  )
                  .toList()),
        ),
      ),
    );
  }
}
