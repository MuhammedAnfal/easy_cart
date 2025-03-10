import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/features/shop/screens/order/widget/orders_list.dart';
import 'package:e_commerce/features/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //-- appbar
      appBar: AppsAppBar(title: Text('My orders', style: Theme.of(context).textTheme.headlineSmall), showBackArrow: false),
      body: const Padding(
        padding: EdgeInsets.all(AppSizes.defaultSpace),

        //-- orders
        child: AppOrdersListScreen(),
      ),
    );
  }
}
