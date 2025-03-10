import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/layOut/grid_layout.dart';
import 'package:e_commerce/common/widgets/store/app_brand_card.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/features/shop/screens/brand/brand_products.dart';
import 'package:e_commerce/features/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppsAppBar(
          showBackArrow: true,
          title: Text('Brand'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppSizes.defaultSpace),
            child: Column(
              children: [
                //-- heading
                const AppSectionHeading(title: 'Brands', showActionButton: false),
                const SizedBox(height: AppSizes.spaceBtwItems),

                //-- brands
                AppGridLayout(
                  mainAxisExtend: 80,
                  itemCount: 8,
                  itemBuilder: (context, index) => AppBrandCard(showBorder: true, ontap: () => Get.to(const BrandProducts ())),
                )
              ],
            ),
          ),
        ));
  }
}
