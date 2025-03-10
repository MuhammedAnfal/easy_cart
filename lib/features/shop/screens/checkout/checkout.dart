import 'dart:convert';

import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_commerce/common/widgets/products/products/cart/coupen_widget.dart';
import 'package:e_commerce/common/widgets/success_screen/payment_success_screen.dart';
import 'package:e_commerce/features/shop/screens/cart/widget/app_cart_items.dart';
import 'package:e_commerce/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:e_commerce/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:e_commerce/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:e_commerce/features/utils/constants/colors.dart';
import 'package:e_commerce/features/utils/constants/image_strings.dart';
import 'package:e_commerce/features/utils/constants/sizes.dart';
import 'package:e_commerce/features/utils/helpers/helper_function.dart';
import 'package:e_commerce/navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  //-- variables
  // late Razorpay _razorpay;

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Success')));
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.error.toString())));
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.walletName.toString())));
  }

  final String keyId = '[YOUR_KEY_ID]';
  final String keySecret = '[YOUR_KEY_SECRET]';
  final String url = 'https://api.razorpay.com/v1/orders';

  // final headers = {
  //   'Content-Type': 'application/json',
  //   'Authorization': 'Basic ' + base64Encode(utf8.encode('$keyId:$keySecret'))
  // };

  // void initiatePayment(String orderId) {
  //   var options = {
  //     'key': '',
  //     'amount': 10 * 50000, // in paise (500 INR)*
  //     'name': 'Acme Corp.',
  //     'order_id': orderId, // Order ID from backend
  //     'description': 'Fine T-Shirt',
  //     'timeout': 60, // in seconds
  //     'prefill': {'contact': '9000090000', 'email': 'gaurav.kumar@example.com'}
  //   };

  // try {
  //   _razorpay.open(options);
  // } catch (e) {
  //   print('Error opening Razorpay payment: $e');
  // }
  // }

  @override
  void initState() {
    // _razorpay = Razorpay();

    // TODO: implement initState
    super.initState();
    // _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    // _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    // _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // _razorpay.clear(); // Removes all listeners
  }

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunction.isDarkMode(context);
    return Scaffold(
        //--  checkout button
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: ElevatedButton(
              // onPressed: () => initiatePayment('order_EMBFqjDHEEn80l'),
              onPressed: () => Get.to(PaymentSuccessScreen(
                    image: AppImages.paymentSuccess,
                    title: 'Payment Success',
                    subTitle: 'Your item will be shipped soon!',
                    onPressed: () => Get.offAll(const NavigationMenu()),
                  )),
              child: const Text('Checkout \$256.0')),
        ),
        appBar: AppsAppBar(title: Text('Order View', style: Theme.of(context).textTheme.headlineSmall)),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppSizes.defaultSpace),
            child: Column(
              children: [
                //-- items in cart
                const AppCartItems(),
                const SizedBox(height: AppSizes.spaceBtwSections),

                //-- coupen textField
                const AppCoupenCode(),
                const SizedBox(
                  height: AppSizes.spaceBtwSections,
                ),

                //-- billing section
                TcircularContainer(
                  showBorder: true,
                  backgroudColor: dark ? AppColors.black : AppColors.white,
                  padding: const EdgeInsets.all(AppSizes.md),
                  child: const Column(
                    children: [
                      //--  pricing
                      AppBillingAmountSection(),
                      SizedBox(height: AppSizes.spaceBtwItems),

                      //--  divider
                      Divider(),
                      SizedBox(height: AppSizes.spaceBtwItems),

                      //--  payment method
                      AppBillingPaymentSection(),
                      SizedBox(height: AppSizes.spaceBtwItems),
                      //--  address

                      AppBillingAddressSection()
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
