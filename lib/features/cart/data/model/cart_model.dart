import 'package:flutter_demo_app/features/cart/domain/entity/cart.dart';
import 'package:flutter_demo_app/features/store/data/model/product_model.dart';

class CartModel extends Cart {
  CartModel({
    required super.amount,
    required super.productModel,
    required super.price,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
      amount: json['amount'],
      productModel: ProductModel.fromJson(json['product']),
      price: json['price']);
}
