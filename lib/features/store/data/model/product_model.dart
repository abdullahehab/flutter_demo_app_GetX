import 'package:flutter_demo_app/features/store/domain/entities/product.dart';

class ProductModel extends Product {
   ProductModel({
    required super.name,
    required super.id,
    required super.categoryId,
    required super.availableDate,
    required super.distance,
    required super.isFavourite,
    required super.price,
    required super.priceAfterDiscount,
    required super.quantity,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
      name: json['name'],
      id: json['id'],
      categoryId: json['category_id'],
      availableDate: json['available_date'],
      distance: json['distance'],
      isFavourite: json['is_favourite'],
      price: json['price'],
      priceAfterDiscount: json['discount_price'],
      quantity: json['quantity']);
}
