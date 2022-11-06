import 'package:equatable/equatable.dart';

import '../../../../core/utils/app_constants.dart';

class BottomBarData extends Equatable {
  final String image;
  final String name;

  const BottomBarData({required this.image, required this.name});

  @override
  List<Object> get props => [image, name];

  static List<BottomBarData> bottomDataList = const [
    BottomBarData(name: 'Grocery', image: AppConstants.groceryIcon),
    BottomBarData(name: 'News', image: AppConstants.newsIcon),
    BottomBarData(name: '', image: AppConstants.shippingIcon),
    BottomBarData(name: 'Favorites', image: AppConstants.favIcon),
    BottomBarData(name: 'Cart', image: AppConstants.cartIcon),
  ];
}
