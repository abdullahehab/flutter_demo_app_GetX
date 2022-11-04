import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_demo_app/features/store/domain/entities/address.dart';
import 'package:flutter_demo_app/features/store/presentation/controller/home_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => BuildBody(addressesList: state!),
      onLoading: const Scaffold(
        body: Center(
          child: CupertinoActivityIndicator(),
        ),
      ),
    );
  }
}

class BuildBody extends StatelessWidget {
  const BuildBody({Key? key, required this.addressesList}) : super(key: key);

  final List<Address> addressesList;
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
