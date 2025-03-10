import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/product_image_detail_slider.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:e_commerce/features/shop/screens/product_reviews/product_review.dart';
import 'package:e_commerce/features/utils/constants/sizes.dart';
import 'package:e_commerce/features/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunction.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: const AppBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //--  product image slider
            const AppProductImageSlider(),

            //-- product details
            Padding(
              padding: const EdgeInsets.only(
                left: AppSizes.defaultSpace,
                right: AppSizes.defaultSpace,
                bottom: AppSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  //-- rating and share button
                  const AppRatingAndShare(),

                  //-- price ,title, stock, brand
                  const ProductMetaData(),

                  //-- attributes
                  const AppProductAttributes(),
                  const SizedBox(height: AppSizes.spaceBtwSections),

                  //-- check out button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: () {}, child: const Text('Checkout')),
                  ),
                  const SizedBox(height: AppSizes.spaceBtwSections),

                  //-- description
                  const AppSectionHeading(
                    title: 'Description',
                  ),
                  const SizedBox(height: AppSizes.spaceBtwItems),
                  const ReadMoreText(
                    'This is the  product description abount nike jordan, which have highly offer now and it is the most selling item in the store now ,and also most demanding item',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Show less',
                    moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  // reveiws
                  const Divider(),
                  const SizedBox(height: AppSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppSectionHeading(title: 'Reviews(199)', showActionButton: false, onPressed: () {}),
                      IconButton(
                          onPressed: () => Get.to(const ProductReviewScreen()),
                          icon: const Icon(
                            Iconsax.arrow_right_24,
                            size: 18,
                          ))
                    ],
                  ),
                  const SizedBox(height: AppSizes.spaceBtwSections),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
