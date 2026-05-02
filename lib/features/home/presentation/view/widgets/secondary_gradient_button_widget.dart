import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syntra_ai/core/utils/app_colors.dart';

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
    return Container(
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
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: icon != null
          ? Row(
              spacing: size.width * 0.02,
              children: [
                Icon(icon, color: AppColors.primary),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                  // style: TextStyle(
                  //   fontSize: 18.sp,
                  //   fontWeight: FontWeight.bold,
                  //   color: AppColors.primary,
                  // ),
                ),
              ],
            )
          : Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
              // style: TextStyle(
              //   fontSize: 18.sp,
              //   fontWeight: FontWeight.bold,
              //   color: AppColors.primary,
              // ),
            ),
    );
  }
}
