class ProductAttributeModel {
  String? name;
  final List<String>? values;

  ProductAttributeModel({
    this.name,
    this.values,
  });



  ProductAttributeModel copyWith({
    String? name,
    List<String>? values,
  }) {
    return ProductAttributeModel(
      name: name ?? this.name,
      values: values ?? this.values,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'values': this.values,
    };
  }

  factory ProductAttributeModel.fromMap(Map<String, dynamic> map) {
    return ProductAttributeModel(
      name: map['name'] ??'',
      values: map['values'] ??[],
    );
  }

}