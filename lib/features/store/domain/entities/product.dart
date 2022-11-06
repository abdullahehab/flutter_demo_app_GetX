import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final int categoryId;
  final String name;
  int quantity;
  final int distance;
  final String price;
  bool isFavourite;
  final String? priceAfterDiscount;
  final String? availableDate;

  Product(
      {required this.id,
      required this.categoryId,
      required this.name,
      required this.quantity,
      required this.distance,
      required this.isFavourite,
      required this.price,
      this.availableDate,
      this.priceAfterDiscount});

  @override
  List<Object?> get props => [
        id,
        categoryId,
        name,
        quantity,
        distance,
        isFavourite,
        price,
        availableDate,
        priceAfterDiscount,
      ];
}
