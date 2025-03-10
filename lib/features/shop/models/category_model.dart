import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id;
  String name;
  bool isFeatured;
  String parentId;
  String image;
  CategoryModel({
    required this.id,
    this.parentId = ' ',
    required this.name,
    required this.isFeatured,
    required this.image,
  });

  //-- empty helper function
  static CategoryModel empty() => CategoryModel(id: '', name: '', isFeatured: false, image: '');

  //-- conver model to json so that you can store data in firebase
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'isFeatured': isFeatured,
      'parentId': parentId,
      'image': image,
    };
  }

  //-- map json oriented document snapshot from firebase to userModel
  factory CategoryModel.fromJson(DocumentSnapshot<Map<String, dynamic>> json) {
    if (json.data() != null) {
      final data = json.data()!;
      //-- map json record to the model
      return CategoryModel(
        id: data['id'] ?? '',
        name: data['name'] ?? "",
        parentId: data['parentId'] ?? "",
        isFeatured: data['isFeatured'] ?? false,
        image: data['image'] ?? "",
      );
    } else {
      return CategoryModel.empty();
    }
  }
}
