import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String name;
  final int quantity;
  final String distance;
  final String price;
  final bool isFavourite;
  final String? priceAfterDiscount;
  final String? availableDate;

  const Product(
      {required this.id,
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
        name,
        quantity,
        distance,
        isFavourite,
        price,
        availableDate,
        priceAfterDiscount,
      ];
}
