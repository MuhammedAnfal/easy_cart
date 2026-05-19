import 'package:e_commerce/features/shop/models/banner_model.dart';
import 'package:e_commerce/features/shop/models/brand_model.dart';
import 'package:e_commerce/features/shop/models/category_model.dart';
import 'package:e_commerce/features/shop/models/product_attribute_model.dart';
import 'package:e_commerce/features/utils/constants/image_strings.dart';

import '../../shop/models/product_model.dart';
import '../../shop/models/product_variation_model.dart';

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
    CategoryModel(id: '1', name: 'Electronics', image: AppImages.electronicIcon, isFeatured: true),
    CategoryModel(id: '2', name: 'Furniture', image: AppImages.furnitureIcon, isFeatured: true),
    CategoryModel(id: '3', name: 'Electronics', image: AppImages.electronicIcon, isFeatured: true),
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

  //-- list of all brands
  static final List<BrandModel> brands = [
    BrandModel(id: '1', name: 'Nike', image: AppImages.nikeLogo, isFeatured: true, productsCount: 265),
    BrandModel(id: '2', name: 'Adidas', image: AppImages.adidasLogo, isFeatured: true, productsCount: 245),
    BrandModel(id: '3', name: 'Puma', image: AppImages.pumaLogo, isFeatured: false, productsCount: 200),
    BrandModel(id: '4', name: 'Samsung', image: AppImages.samsungLogo, isFeatured: true, productsCount: 180),
    BrandModel(id: '5', name: 'Apple', image: AppImages.appleLogo, isFeatured: true, productsCount: 180),
    BrandModel(id: '6', name: 'Jordan', image: AppImages.jordanLogo, isFeatured: true, productsCount: 180),
    BrandModel(id: '7', name: 'Zara', image: AppImages.zaraLogo, isFeatured: true, productsCount: 180),
  ];

  //-- list of all brand categories
  // static final List<Brand> brandCategories = [
  //
  // ]


  //-- list of all Product Categories
  // static final List<ProductCa> productCategories =[];


  //-- list of all  dummy products upload to firestore
  static final List<ProductModel> products = [
    ProductModel(
        id: '001',
        stock: 15,
        price: 135,
        title: 'Green Nike Sport Shoe',
        salesPrice: 30,
        thumbnail: AppImages.shoes1,
        description: 'Green Nike Sport Shoe',
        brand: BrandModel(id: '1', name: 'Nike', image: AppImages.shoes1),
        images: [AppImages.shoes1, AppImages.shoes2],
        sku: 'ABR4568',
        categoryId: '1',
        productAttributes: [
          ProductAttributeModel(name: 'Color', values: ['Green ,Red']),
          ProductAttributeModel(name: 'Size', values: ['EU 42', 'EU 43', 'EU 44']),
        ],
        productVariations: [
          ProductVariationModel(
              id: '1',
              stock: 34,
              salePrice: 132,
              price: 134,
              image: AppImages.shoes1,
              description: 'This is a product description for green nike sports shoe',
              attributeValues: {
                'Color': 'Green',
                'Size': 'EU 42',
              },
              sku: 'ARB145'),
          ProductVariationModel(
              id: '2',
              stock: 30,
              salePrice: 100,
              price: 120,
              image: AppImages.shoes1,
              description: 'This is a product description for green nike sports shoe',
              attributeValues: {
                'Color': 'Red',
                'Size': 'EU 40',
              },
              sku: 'ARB145')
        ],
        productType: 'productType.variable',
        isFeatured: true),
    ProductModel(
        id: '004',
        stock: 10,
        price: 200,
        title: 'Green Nike shirt',
        salesPrice: 70,
        thumbnail: AppImages.shirt,
        description: 'Green Nike shirt',
        brand: BrandModel(id: '6', name: 'Nike', image: AppImages.shirt),
        images: [AppImages.shirt, AppImages.shirt1],
        sku: 'ABR4567',
        categoryId: '16',
        productAttributes: [
          ProductAttributeModel(name: 'Color', values: ['Green ,blue']),
          ProductAttributeModel(name: 'Size', values: ['EU 42', 'EU 43', 'EU 44']),
        ],
        productVariations: [
          ProductVariationModel(
              id: '1',
              stock: 20,
              salePrice: 100,
              price: 134,
              image: AppImages.shirt1,
              description: 'This is a product description for green nike shirt',
              attributeValues: {
                'Color': 'Green',
                'Size': 'Small',
              },
              sku: 'ARB145'),
          ProductVariationModel(
              id: '2',
              stock: 25,
              salePrice: 100,
              price: 150,
              image: AppImages.shirt2,
              description: 'This is a product description for blue shirt',
              attributeValues: {
                'Color': 'blue',
                'Size': 'Medium',
              },
              sku: 'ARB135')
        ],
        productType: 'productType.variable',
        isFeatured: true),
  ];
}
