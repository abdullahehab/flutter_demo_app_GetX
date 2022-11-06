import 'package:flutter_demo_app/core/widgets/toaster.dart';
import 'package:flutter_demo_app/features/store/domain/entities/address.dart';
import 'package:flutter_demo_app/features/store/domain/entities/categories.dart';
import 'package:flutter_demo_app/features/store/domain/entities/product.dart';
import 'package:flutter_demo_app/features/store/domain/usercases/get_addresses_usecase.dart';
import 'package:flutter_demo_app/features/store/domain/usercases/get_banner_usecase.dart';
import 'package:flutter_demo_app/features/store/domain/usercases/get_categories_usecase.dart';
import 'package:flutter_demo_app/features/store/domain/usercases/get_dealOfTheDay_usecase.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with StateMixin {
  final GetAddressUseCase _addressUseCase;
  final GetCategoriesUseCase _categoriesUseCase;
  final GetDealOfTheDayUseCase _dealOfTheDayUseCase;
  final GetBannerUseCase _bannerUseCase;

  @override
  void onInit() async {
    await getAddresses();
    await getCategories();
    await getDealOfTheDay();
    await getBanner();
    return super.onInit();
  }

  var addresses = RxList<Address>([]);
  var categories = RxList<Categories>([]);
  var dealOfTheDay = RxList<Product>([]);
  var favoriteList = RxList<Product>([]);
  final banner = Product(
    quantity: 0,
    categoryId: 0,
    id: 0,
    name: '',
    isFavourite: false,
    distance: 0,
    price: '',
  ).obs;

  Future getAddresses() async {
    var data = await _addressUseCase();
    data.fold(
      (failure) => print('get address failure => ${failure.message}'),
      (dataList) {
        addresses.addAll(dataList);
        change(null, status: RxStatus.success());
      },
    );
  }

  Future getCategories() async {
    var data = await _categoriesUseCase();
    data.fold(
      (failure) => print('get address failure => ${failure.message}'),
      (dataList) {
        categories.addAll(dataList);
        change(null, status: RxStatus.success());
      },
    );
  }

  Future getDealOfTheDay() async {
    var data = await _dealOfTheDayUseCase();
    data.fold(
      (failure) => print('get address failure => ${failure.message}'),
      (dataList) {
        dealOfTheDay.addAll(dataList);
        change(null, status: RxStatus.success());
      },
    );
  }

  Future getBanner() async {
    change(null, status: RxStatus.loading());
    var data = await _bannerUseCase();
    data.fold(
      (failure) => print('get address failure => ${failure.message}'),
      (result) {
        banner.value = result;
        change(null, status: RxStatus.success());
      },
    );
  }

  addRemoveFavourite({required Product product}) {
    var item = dealOfTheDay.firstWhere((element) => element.id == product.id);

    item.isFavourite = !item.isFavourite;

    update();

    getFavouriteList();

    showToast(
        message: item.isFavourite == true
            ? 'Added to Favorite'
            : "Removed to Favorite");
  }

  getFavouriteList() {
    favoriteList.value = dealOfTheDay.where((p0) => p0.isFavourite).toList();

    update();
  }

  HomeController(this._addressUseCase, this._categoriesUseCase,
      this._dealOfTheDayUseCase, this._bannerUseCase);
}
