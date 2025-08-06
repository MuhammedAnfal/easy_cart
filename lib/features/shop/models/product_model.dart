import 'package:e_commerce/features/shop/models/banner_model.dart';
import 'package:e_commerce/features/shop/models/brand_model.dart';
import 'package:e_commerce/features/shop/models/product_attribute_model.dart';
import 'package:e_commerce/features/shop/models/product_variation_model.dart';

class ProductModel {
  String id;
  int stock;
  String? sku;
  double price;
  String title;
  DateTime? date;
  double salesPrice;
  String thumbnail;
  bool? isFeatured;
  BrandModel? brand;
  String? description;
  String? categoryId;
  List<String>? images;
  String productType;
  List<ProductAttributeModel>? productAttributes;
  List<ProductVariationModel>? productVariations;

//<editor-fold desc="Data Methods">
  ProductModel({
    required this.id,
    required this.stock,
    this.sku,
    required this.price,
    required this.title,
    this.date,
    required this.salesPrice,
    required this.thumbnail,
    this.isFeatured,
    this.brand,
    this.description,
    this.categoryId,
    this.images,
    required this.productType,
    this.productAttributes,
    this.productVariations,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          stock == other.stock &&
          sku == other.sku &&
          price == other.price &&
          title == other.title &&
          date == other.date &&
          salesPrice == other.salesPrice &&
          thumbnail == other.thumbnail &&
          isFeatured == other.isFeatured &&
          brand == other.brand &&
          description == other.description &&
          categoryId == other.categoryId &&
          images == other.images &&
          productType == other.productType &&
          productAttributes == other.productAttributes &&
          productVariations == other.productVariations);

  @override
  int get hashCode =>
      id.hashCode ^
      stock.hashCode ^
      sku.hashCode ^
      price.hashCode ^
      title.hashCode ^
      date.hashCode ^
      salesPrice.hashCode ^
      thumbnail.hashCode ^
      isFeatured.hashCode ^
      brand.hashCode ^
      description.hashCode ^
      categoryId.hashCode ^
      images.hashCode ^
      productType.hashCode ^
      productAttributes.hashCode ^
      productVariations.hashCode;

  @override
  String toString() {
    return 'ProductModel{' +
        ' id: $id,' +
        ' stock: $stock,' +
        ' sku: $sku,' +
        ' price: $price,' +
        ' title: $title,' +
        ' date: $date,' +
        ' salesPrice: $salesPrice,' +
        ' thumbnail: $thumbnail,' +
        ' isFeatured: $isFeatured,' +
        ' brand: $brand,' +
        ' description: $description,' +
        ' categoryId: $categoryId,' +
        ' images: $images,' +
        ' productType: $productType,' +
        ' productAttributes: $productAttributes,' +
        ' productVariations: $productVariations,' +
        '}';
  }

  ProductModel copyWith({
    String? id,
    int? stock,
    String? sku,
    double? price,
    String? title,
    DateTime? date,
    double? salesPrice,
    String? thumbnail,
    bool? isFeatured,
    BrandModel? brand,
    String? description,
    String? categoryId,
    List<String>? images,
    String? productType,
    List<ProductAttributeModel>? productAttributes,
    List<ProductVariationModel>? productVariations,
  }) {
    return ProductModel(
      id: id ?? this.id,
      stock: stock ?? this.stock,
      sku: sku ?? this.sku,
      price: price ?? this.price,
      title: title ?? this.title,
      date: date ?? this.date,
      salesPrice: salesPrice ?? this.salesPrice,
      thumbnail: thumbnail ?? this.thumbnail,
      isFeatured: isFeatured ?? this.isFeatured,
      brand: brand ?? this.brand,
      description: description ?? this.description,
      categoryId: categoryId ?? this.categoryId,
      images: images ?? this.images,
      productType: productType ?? this.productType,
      productAttributes: productAttributes ?? this.productAttributes,
      productVariations: productVariations ?? this.productVariations,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'stock': this.stock,
      'sku': this.sku,
      'price': this.price,
      'title': this.title,
      'date': this.date,
      'salesPrice': this.salesPrice,
      'thumbnail': this.thumbnail,
      'isFeatured': this.isFeatured,
      'brand': this.brand,
      'description': this.description,
      'categoryId': this.categoryId,
      'images': this.images,
      'productType': this.productType,
      'productAttributes': this.productAttributes,
      'productVariations': this.productVariations,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] ?? '',
      stock: map['stock'] ?? 0,
      sku: map['sku'] ?? '',
      price: map['price'] ?? 0,
      title: map['title'] ?? '',
      date: map['date'] ?? DateTime.now(),
      salesPrice: map['salesPrice'] ?? 0,
      thumbnail: map['thumbnail'] ?? '',
      isFeatured: map['isFeatured'] ?? false,
      brand: BrandModel.fromMap(map['brand'] ?? {}),
      description: map['description'] ?? '',
      categoryId: map['categoryId'] ?? '',
      images: map['images'] ?? [],
      productType: map['productType'] ?? '',
      productAttributes: (map['productAttributes'] as List<dynamic>)
          .map(
            (e) => ProductAttributeModel.fromMap(e),
          )
          .toList(),
      productVariations: (map['productVariations'] as List<dynamic>)
              .map(
                (e) => ProductVariationModel.fromMap(e),
              )
              .toList() ??
          [],
    );
  }
}
