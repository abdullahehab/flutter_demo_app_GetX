import 'package:flutter_demo_app/features/store/data/repository/home_repository.dart';
import 'package:flutter_demo_app/features/store/domain/usercases/get_addresses_usecase.dart';
import 'package:flutter_demo_app/features/store/presentation/controller/home_controller.dart';
import 'package:get/get.dart';

class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetAddressUseCase(Get.find<HomeRepository>()));
    Get.lazyPut(() => HomeController(Get.find()));
  }
}
