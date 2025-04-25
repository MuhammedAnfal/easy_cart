class ProductVariationModel {
  final String id;
  String sku;
  String image;
  String? description;
  double price;
  double salePrice;
  int stock;
  Map<String, String> attributeValues;

//<editor-fold desc="Data Methods">
  ProductVariationModel({
    required this.id,
    required this.sku,
    required this.image,
    this.description,
    required this.price,
    required this.salePrice,
    required this.stock,
    required this.attributeValues,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductVariationModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          sku == other.sku &&
          image == other.image &&
          description == other.description &&
          price == other.price &&
          salePrice == other.salePrice &&
          stock == other.stock &&
          attributeValues == other.attributeValues);

  @override
  int get hashCode =>
      id.hashCode ^
      sku.hashCode ^
      image.hashCode ^
      description.hashCode ^
      price.hashCode ^
      salePrice.hashCode ^
      stock.hashCode ^
      attributeValues.hashCode;

  @override
  String toString() {
    return 'ProductVariationModel{' +
        ' id: $id,' +
        ' sku: $sku,' +
        ' image: $image,' +
        ' description: $description,' +
        ' price: $price,' +
        ' salePrice: $salePrice,' +
        ' stock: $stock,' +
        ' attributeValues: $attributeValues,' +
        '}';
  }

  ProductVariationModel copyWith({
    String? id,
    String? sku,
    String? image,
    String? description,
    double? price,
    double? salePrice,
    int? stock,
    Map<String, String>? attributeValues,
  }) {
    return ProductVariationModel(
      id: id ?? this.id,
      sku: sku ?? this.sku,
      image: image ?? this.image,
      description: description ?? this.description,
      price: price ?? this.price,
      salePrice: salePrice ?? this.salePrice,
      stock: stock ?? this.stock,
      attributeValues: attributeValues ?? this.attributeValues,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'sku': this.sku,
      'image': this.image,
      'description': this.description,
      'price': this.price,
      'salePrice': this.salePrice,
      'stock': this.stock,
      'attributeValues': this.attributeValues,
    };
  }

  factory ProductVariationModel.fromMap(Map<String, dynamic> map) {
    return ProductVariationModel(
      id: map['id'] ?? '',
      sku: map['sku'] ?? '',
      image: map['image'] ?? '',
      description: map['description'] ?? '',
      price: map['price'] ?? 0,
      salePrice: map['salePrice'] ?? 0,
      stock: map['stock'] as int,
      attributeValues: map['attributeValues'] ?? {},
    );
  }

//</editor-fold>
}
