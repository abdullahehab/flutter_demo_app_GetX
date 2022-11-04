import 'package:flutter_demo_app/features/store/domain/entities/address.dart';
import 'package:flutter_demo_app/features/store/domain/usercases/get_addresses_usecase.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with StateMixin<List<Address>> {
  final GetAddressUseCase _addressUseCase;

  @override
  void onInit() async {
    getAddresses();
    return super.onInit();
  }

  var addresses = RxList<Address>([]);

  getAddresses() async {
    change(null, status: RxStatus.loading());
    var data = await _addressUseCase();
    data.fold(
      (failure) {
        print('get address failure => ${failure.message}');
      },
      (dataList) {
        if (dataList.isEmpty) {
          change(null, status: RxStatus.empty());
        } else {
          addresses.addAll(dataList);
          change(dataList, status: RxStatus.success());
        }
      },
    );
  }

  HomeController(this._addressUseCase);
}
