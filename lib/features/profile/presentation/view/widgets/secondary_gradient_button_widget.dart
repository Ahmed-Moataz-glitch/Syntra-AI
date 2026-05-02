import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syntra_ai/core/utils/app_colors.dart';
import 'package:syntra_ai/core/utils/app_localization.dart';

class SecondaryGradientButtonWidget extends StatelessWidget {
  final IconData? icon;
  final String title;
  final VoidCallback onPressed;
  const SecondaryGradientButtonWidget({
    super.key,
    this.icon,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.symmetric(
            vertical: size.height * 0.01, horizontal: size.width * 0.05),
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            stops: [0.1, 0.8],
            colors: [
              AppColors.blue.withValues(alpha: 170, blue: 120),
              AppColors.purple.withValues(alpha: 170, blue: 150),
            ],
            transform: const GradientRotation(0.2),
          ),
          boxShadow: isLightMode ? [
            BoxShadow(
              color: AppColors.purple.withValues(alpha: 50, blue: 100),
              blurRadius: 4,
              spreadRadius: 0.3,
              offset: const Offset(-2, 3),
            ),
          ]
          : null,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: icon != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: size.width * 0.02,
                children: [
                  AppLocalization.isArabic()
                  ? const SizedBox.shrink()
                  : Icon(icon, color: AppColors.primary),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                    // style: TextStyle(
                    //   fontSize: 18.sp,
                    //   fontWeight: FontWeight.bold,
                    //   color: AppColors.primary,
                    // ),
                  ),
                  AppLocalization.isArabic()
                  ? Icon(icon, color: AppColors.primary)
                  : const SizedBox.shrink(),
                ],
              )
            : Text(
                title,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
                // style: TextStyle(
                //   fontSize: 18.sp,
                //   fontWeight: FontWeight.bold,
                //   color: AppColors.primary,
                // ),
              ),
      ),
    );
  }
}
