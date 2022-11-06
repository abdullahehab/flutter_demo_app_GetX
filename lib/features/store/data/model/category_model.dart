import 'package:flutter_demo_app/features/store/domain/entities/categories.dart';

class CategoryModel extends Categories {
  const CategoryModel({
    required super.id,
    required super.name,
    required super.color,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json['id'],
        name: json['name'],
        color: json['color'],
      );
}
