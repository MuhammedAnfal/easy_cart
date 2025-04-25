class BrandModel {
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productsCount;

//<editor-fold desc="Data Methods">
  BrandModel({
    required this.id,
    required this.name,
    required this.image,
    this.isFeatured,
    this.productsCount,
  });


//-- empty helper function
  static BrandModel empty() => BrandModel(id: '', name: '', image: '', );


  BrandModel copyWith({
    String? id,
    String? name,
    String? image,
    bool? isFeatured,
    int? productCount,
  }) {
    return BrandModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      isFeatured: isFeatured ?? this.isFeatured,
      productsCount: productCount ?? this.productsCount,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'image': this.image,
      'isFeatured': this.isFeatured,
      'productCount': this.productsCount,
    };
  }

  factory BrandModel.fromMap(Map<String, dynamic> map) {
    return BrandModel(
      id: map['id'] as String,
      name: map['name'] as String,
      image: map['image'] as String,
      isFeatured: map['isFeatured'] as bool,
      productsCount: map['productCount'] as int,
    );
  }

//</editor-fold>
}