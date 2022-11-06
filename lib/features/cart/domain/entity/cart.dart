import 'package:equatable/equatable.dart';
import 'package:flutter_demo_app/features/store/data/model/product_model.dart';

import '../../../store/domain/entities/product.dart';

class Cart extends Equatable {
  final Product productModel;
  int price;
  int amount;

  @override
  List<Object> get props => [
        productModel,
        price,
        amount,
      ];

  Cart({required this.productModel, required this.price, required this.amount});

  @override
  String toString() {
    return 'Cart{productModel: $productModel, price: $price, amount: $amount}';
  }
}
