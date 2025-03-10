import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/products/rating/rating_indicator.dart';
import 'package:e_commerce/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:e_commerce/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:e_commerce/features/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ProductReviewScreen extends StatefulWidget {
  const ProductReviewScreen({super.key});

  @override
  State<ProductReviewScreen> createState() => _ProductReviewScreenState();
}

class _ProductReviewScreenState extends State<ProductReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //-- appBar
      appBar: const AppsAppBar(
        title: Text('Review & Ratings'),
        showBackArrow: false,
      ),

      //-- body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Rating & Reviews are verified  and are from  people  who use the same type of device that you use'),
              const SizedBox(height: AppSizes.spaceBtwItems),

              //-- overall product rating
              const AppOverAllProductRating(),
              const AppRatingBarIndicator(rating: 3.5),
              Text('12,611', style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: AppSizes.spaceBtwItems),

              //-- user review list
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
