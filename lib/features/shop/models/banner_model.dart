// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class BannerModel {
  String imageUrl;
  final String targetScreen;
  final bool active;
  BannerModel({
    required this.imageUrl,
    required this.targetScreen,
    required this.active,
  });

  BannerModel copyWith({
    String? imageUrl,
    String? targetScreen,
    bool? active,
  }) {
    return BannerModel(
      imageUrl: imageUrl ?? this.imageUrl,
      targetScreen: targetScreen ?? this.targetScreen,
      active: active ?? this.active,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'imageUrl': imageUrl,
      'targetScreen': targetScreen,
      'active': active,
    };
  }

  factory BannerModel.fromMap(Map<String, dynamic> map) {
    return BannerModel(
      imageUrl: map['imageUrl'] as String,
      targetScreen: map['targetScreen'] as String,
      active: map['active'] as bool,
    );
  }


}
