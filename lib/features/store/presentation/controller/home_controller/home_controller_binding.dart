import 'package:flutter_demo_app/features/store/data/repository/home_repository.dart';
import 'package:flutter_demo_app/features/store/domain/usercases/get_addresses_usecase.dart';
import 'package:flutter_demo_app/features/store/domain/usercases/get_banner_usecase.dart';
import 'package:flutter_demo_app/features/store/domain/usercases/get_categories_usecase.dart';
import 'package:flutter_demo_app/features/store/domain/usercases/get_dealOfTheDay_usecase.dart';
import 'package:flutter_demo_app/features/store/presentation/controller/home_controller/home_controller.dart';
import 'package:get/get.dart';

class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetAddressUseCase(Get.find<HomeRepository>()));
    Get.lazyPut(() => GetCategoriesUseCase(Get.find<HomeRepository>()));
    Get.lazyPut(() => GetDealOfTheDayUseCase(Get.find<HomeRepository>()));
    Get.lazyPut(() => GetBannerUseCase(Get.find<HomeRepository>()));
    Get.lazyPut(
        () => HomeController(Get.find(), Get.find(), Get.find(), Get.find()));
  }
}
