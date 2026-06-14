import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syntra_ai/core/utils/app_colors.dart';

class LoginMethodWidget extends StatelessWidget {
  const LoginMethodWidget({
    super.key,
    required this.iconPath,
    required this.title,
    required this.onTap,
  });
  final String iconPath;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          decoration: BoxDecoration(
            color:
                isLightMode ? AppColors.blue.withAlpha(30) : AppColors.primary.withAlpha(230),
            borderRadius: BorderRadius.circular(10.r),
            border: !isLightMode
                ? null
                : Border.all(
                    color: AppColors.secondary.withAlpha(150),
                    width: 1.4.r,
                    strokeAlign: BorderSide.strokeAlignOutside,
                  ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                iconPath,
              ),
              SizedBox(width: 12.w),
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontSize: 18.sp,
                      color:
                          isLightMode ? null : AppColors.black.withAlpha(200),
                      fontWeight: isLightMode ? null : FontWeight.w600,
                    ),
                // style: TextStyle(
                //   fontSize: 16.sp,
                //   fontWeight: FontWeight.w500,
                //   color: AppColors.secondary,
                // ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
