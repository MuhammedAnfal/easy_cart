import 'package:e_commerce/features/authentication/screens/login/login.dart';
import 'package:e_commerce/features/authentication/screens/onboarding/onboarding.dart';
import 'package:e_commerce/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:e_commerce/features/authentication/screens/signup/signup.dart';
import 'package:e_commerce/features/authentication/screens/signup/widgets/verify_email.dart';
import 'package:e_commerce/features/personalization/screens/address/address.dart';
import 'package:e_commerce/features/personalization/screens/profile/profile.dart';
import 'package:e_commerce/features/personalization/screens/settings/settings.dart';
import 'package:e_commerce/features/shop/screens/cart/cart_screen.dart';
import 'package:e_commerce/features/shop/screens/checkout/checkout.dart';
import 'package:e_commerce/features/shop/screens/home/home.dart';
import 'package:e_commerce/features/shop/screens/order/order.dart';
import 'package:e_commerce/features/shop/screens/product_reviews/product_review.dart';
import 'package:e_commerce/features/shop/screens/store/brand/store.dart';
import 'package:e_commerce/features/shop/screens/wishlist/wish_list.dart';
import 'package:e_commerce/routes/routes.dart';
import 'package:get/get.dart';

class AppRoutes{
  static final pages =[
    GetPage(name: Routes.home, page: () => const HomeScreen()),
    GetPage(name: Routes.store, page: () => const StoreScreen()),
    GetPage(name: Routes.favourites, page: () => const FavouriteScreen()),
    GetPage(name: Routes.settings, page: () => const SettingsScreen()),
    GetPage(name: Routes.productReviews, page: () => const ProductReviewScreen()),
    GetPage(name: Routes.order, page: () => const OrderScreen()),
    GetPage(name: Routes.checkout, page: () => const CheckoutScreen()),
    GetPage(name: Routes.cart, page: () => const CartScreen()),
    GetPage(name: Routes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: Routes.userAddress, page: () => const UserAddressScreen()),
    GetPage(name: Routes.signUp, page: () =>  const SignupScreen()),
    GetPage(name: Routes.verifyEmail, page: () =>  VerifyEmailScreen()),
    GetPage(name: Routes.signIn, page: () => const LoginScreen()),
    GetPage(name: Routes.forgetPassword, page: () => const ForgetPassword()),
    GetPage(name: Routes.onBoarding, page: () => const OnBoardingScreen()),
  ];
}