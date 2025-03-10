import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/products/sortable/sortable_products.dart';
import 'package:e_commerce/common/widgets/store/app_brand_card.dart';
import 'package:e_commerce/features/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppsAppBar(title: Text('Nike')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              //-- brand detail
              AppBrandCard(showBorder: true),
              SizedBox(height: AppSizes.spaceBtwSections),
              AppSortableProducts()
            ],
          ),
        ),
      ),
    );
  }
}
