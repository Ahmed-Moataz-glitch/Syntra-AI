import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syntra_ai/core/utils/app_colors.dart';

class RowItemWidget extends StatelessWidget {
  final String value;
  final String title;
  const RowItemWidget({super.key, required this.value, required this.title});

  @override
  Widget build(BuildContext context) {
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: title == 'PER WEEK' ? AppColors.blue : (title == 'TOTAL' || title == 'PROGRESS') ? isLightMode ? AppColors.purple : AppColors.orange.withAlpha(220) : isLightMode ? AppColors.black : AppColors.primary.withAlpha(220),
          ),
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 12.sp,
            color: isLightMode ? AppColors.secondary.withAlpha(220) : AppColors.primary.withAlpha(180),
          ),
        ),
      ],
    );
  }
}
