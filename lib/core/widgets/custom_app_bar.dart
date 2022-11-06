import 'package:flutter/material.dart';
import 'package:flutter_demo_app/core/extensions/extension.dart';
import 'package:flutter_demo_app/core/utils/app_colors.dart';
import 'package:flutter_demo_app/core/utils/app_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, this.extraWidget}) : super(key: key);

  final Widget? extraWidget;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                Image.asset(AppConstants.addressContainer),
                Row(
                  children: [
                    SvgPicture.asset(
                      AppConstants.locationIcon,
                      width: 16.w,
                      height: 16.h,
                      color: Colors.white,
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      'Mustafa St.',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ).addPaddingOnly(left: 10)
              ],
            ),
            Container(
              width: 30.r,
              height: 30.r,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.borderColor)),
            )
          ],
        ),
        extraWidget ?? const SizedBox()
      ],
    );
  }
}
