import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_demo_app/core/utils/app_colors.dart';
import 'package:flutter_demo_app/core/utils/app_constants.dart';
import 'package:flutter_demo_app/features/store/presentation/controller/home_controller/home_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../../core/extensions/extension.dart' as ex;
import '../../../../core/widgets/custom_app_bar.dart';
import '../components/address_list_component.dart';
import '../components/banner_component.dart';
import '../components/categories_list_component.dart';
import '../components/deals_of_the_day_list_component.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (_) => const BuildBody(),
      onLoading: const Scaffold(
        body: Center(
          child: CupertinoActivityIndicator(),
        ),
      ),
    );
  }
}

class BuildBody extends StatelessWidget {
  const BuildBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<HomeController>();
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
                extraWidget: Container(
              decoration: BoxDecoration(
                color: AppColors.textFiledColor,
                borderRadius: BorderRadius.circular(AppConstants.borderRadius),
                border: Border.all(color: AppColors.textFiledBorderColor),
              ),
              height: 42.h,
              child: TextFormField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search in thousands of products',
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                ),
              ),
            ).addPaddingOnly(top: 20)),
            SizedBox(height: 25.h),
            Expanded(
                child: ListView(
              children: [
                const AddressesListComponents(),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Explore by Category',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'See All (${controller.categories.length})',
                      style: TextStyle(
                          fontSize: 12.sp, color: AppColors.greyTextColor),
                    )
                  ],
                ),
                SizedBox(height: 17.h),
                const CategoriesListComponents(),
                SizedBox(height: 17.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Deals of the day',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 17.h),
                const DealsOfTheDayListComponent(),
                SizedBox(height: 17.h),
                const BannerComponent()
              ],
            )),
          ],
        ),
      ).addPaddingHorizontalVertical(horizontal: 11),
    );
  }
}
