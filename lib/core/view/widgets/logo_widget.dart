import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syntra_ai/core/utils/app_assets.dart';
import 'package:syntra_ai/core/utils/app_colors.dart';
import 'package:syntra_ai/core/utils/app_localization.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
  final size = MediaQuery.of(context).size;
  final isLightMode = Theme.of(context).brightness == Brightness.light;
    return Container(
      margin: isLightMode
          ? EdgeInsets.zero
          : AppLocalization.isArabic()
              ? EdgeInsets.only(right: 12.w, top: 10.h, bottom: 6.h)
              : EdgeInsets.only(left: 12.w, top: 10.h, bottom: 6.h),
      padding:
          isLightMode ? EdgeInsets.zero : EdgeInsets.symmetric(horizontal: 2.w),
      decoration: BoxDecoration(
        color: isLightMode ? AppColors.transparent : AppColors.primary,
        // color: AppColors.appBarTitleBackgroundColor,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Row(
        children: [
          AppLocalization.isArabic()
              ? SizedBox(width: size.width * 0.015)
              : SizedBox(width: size.width * 0.03),
          AppLocalization.isArabic()
              ? const SizedBox.shrink()
              : SvgPicture.asset(
                  AppAssets.syntraAiLogo,
                  width: 32.w,
                  height: 32.h,
                ),
          SizedBox(width: 8.w),
          Text.rich(
            TextSpan(
              text: 'syntra.',
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontSize: 24.sp,
                    color: isLightMode ? null : AppColors.black.withAlpha(200),
                  ),
              // style: TextStyle(
              //   fontSize: 32.sp,
              //   fontWeight: FontWeight.w500,
              //   color: AppColors.black,
              // ),
              children: [
                TextSpan(
                  text: 'ai',
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.purple,
                      ),
                  // style: TextStyle(
                  //   fontSize: 32.sp,
                  //   fontWeight: FontWeight.w500,
                  //   color: AppColors.purple,
                  // ),
                ),
              ],
            ),
          ),
          AppLocalization.isArabic()
              ? SizedBox(width: size.width * 0.015)
              : SizedBox(width: size.width * 0.03),
          AppLocalization.isArabic()
              ? SvgPicture.asset(
                  AppAssets.syntraAiLogo,
                  width: 32.w,
                  height: 32.h,
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
