import 'package:flutter_demo_app/features/store/data/datasource/remote_data_source.dart';
import 'package:flutter_demo_app/features/store/data/repository/home_repository.dart';
import 'package:get/get.dart';

import '../../features/store/presentation/controller/home_controller_binding.dart';

class DependencyCreator {
  static init() {
    Get.lazyPut(() => HomeRemoteDataSource());
    Get.lazyPut(() => HomeRepository(Get.find<HomeRemoteDataSource>()));

    HomePageBinding().dependencies();
  }
}
