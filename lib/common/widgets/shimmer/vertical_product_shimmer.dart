import 'package:e_commerce/common/widgets/layOut/grid_layout.dart';
import 'package:e_commerce/common/widgets/shimmer/shimmer.dart';
import 'package:e_commerce/features/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class VerticalProductShimmer extends StatelessWidget {
  const VerticalProductShimmer({super.key,  this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return AppGridLayout(itemCount: itemCount, itemBuilder: (_, __) => const  SizedBox(
      width:  180,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //-- image
         AppShimmerEffect(width: 180, height:180),
          SizedBox(height: AppSizes.spaceBtwItems),

          //-- text
          AppShimmerEffect(width: 160, height:15),
          SizedBox(height: AppSizes.spaceBtwItems/2),
          AppShimmerEffect(width: 110, height:15),

        ],
      ),
    ),);
  }
}
