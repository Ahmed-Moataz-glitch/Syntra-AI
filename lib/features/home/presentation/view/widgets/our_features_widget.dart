import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syntra_ai/core/utils/app_assets.dart';
import 'package:syntra_ai/core/utils/app_colors.dart';
import 'package:syntra_ai/core/utils/app_localization.dart';
import 'package:syntra_ai/generated/l10n.dart';

class OurFeaturesWidget extends StatelessWidget {
  final String title;
  const OurFeaturesWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 40.h,
              width: 40.w,
              decoration: BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
                boxShadow: isLightMode ? [
                  BoxShadow(
                    color: AppColors.dividerColor.withValues(alpha: 100),
                    blurRadius: 0.2,
                    spreadRadius: 0.06,
                    offset: const Offset(0.5, 1),
                  ),
                ]
                : null,
              ),
            ),
            title == S.of(context).home_page_feature4
                ? Icon(Icons.work, color: AppColors.blue.withBlue(220))
                : Image.asset(
                    AppAssets.trueCheckMarkImage,
                    height: size.height * 0.028,
                    width: size.width * 0.08,
                  ),
          ],
        ),
        Expanded(
          child: Container(
            padding: AppLocalization.isArabic()
            ? EdgeInsets.only(right: 12.w, top: 10.h, bottom: 8.h)
            : EdgeInsets.only(left: 12.w, top: 10.h, bottom: 8.h),
            margin: AppLocalization.isArabic()
            ? EdgeInsets.only(right: size.width * 0.05)
            : EdgeInsets.only(left: size.width * 0.05),
            decoration: BoxDecoration(
              color: AppColors.primary,
              boxShadow: isLightMode ? [
                BoxShadow(
                  color: AppColors.dividerColor.withValues(alpha: 100),
                  blurRadius: 1,
                  spreadRadius: 0.3,
                  offset: const Offset(1, 1),
                ),
              ] : null,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: 16.sp,
                color: isLightMode ? null : AppColors.semiBlack.withAlpha(240),
                fontWeight: FontWeight.w700,
              ),
              // style: TextStyle(color: AppColors.semiBlack, fontSize: 15.sp, fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ],
    );
  }
}
