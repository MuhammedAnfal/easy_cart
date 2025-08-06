import 'package:e_commerce/features/shop/models/banner_model.dart';
import 'package:e_commerce/features/shop/models/category_model.dart';
import 'package:e_commerce/features/utils/constants/image_strings.dart';

class AppDummyData {
  //-- banners

  // static final List<BannerModel> banners = [
// BannerModel (imageUrl: AppImages.banner1, targetScreen: TRoutes.order, active: false),
//  BannerModel(image: AppImages.banner2, targetScreen: TRoutes.cart, active: true),
//   BannerModel (image: AppImages.banner3, targetScreen: TRoutes.favourites, active: true),
//    BannerModel (image: AppImages.banner4, targetScreen: TRoutes.search, active: true),
//    BannerModel (image: AppImages.banner5, targetScreen: TRoutes.settings, active: true),
//     BannerModel (image: AppImages.banneró, targetScreen: TRoutes.userAddress, active: true),
//  BannerModel (image: AppImages.banner8, targetScreen: TRoutes.checkout, active: false),
//   ];

//-- list of all categories

  static final List<CategoryModel> categories = [
    CategoryModel(
        id: '1', name: 'Electronics', image: AppImages.electronicIcon, isFeatured: true),
    CategoryModel(
        id: '2', name: 'Furniture', image: AppImages.furnitureIcon, isFeatured: true),
    CategoryModel(
        id: '3', name: 'Electronics', image: AppImages.electronicIcon, isFeatured: true),
    CategoryModel(
      id: '4',
      name: 'Cloths',
      image: AppImages.clothIcon,
      isFeatured: true,
    ),
    CategoryModel(
      id: '5',
      name: 'Animals',
      image: AppImages.animalsIcon,
      isFeatured: true,
    ),
    CategoryModel(
      id: '6',
      name: 'Shoes',
      image: AppImages.shoes1,
      isFeatured: true,
    ),
    CategoryModel(
      id: '7',
      name: 'Cosmetics',
      image: AppImages.shoes1,
      isFeatured: true,
    ),
    CategoryModel(
      id: '8',
      name: 'Jewelry',
      image: AppImages.shoes1,
      isFeatured: true,
    ),
  ];
}
