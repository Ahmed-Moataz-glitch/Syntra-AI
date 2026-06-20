import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syntra_ai/core/utils/app_colors.dart';

class WeaknessesWidget extends StatelessWidget {
  final List<String> weaknesses;
  const WeaknessesWidget({super.key, required this.weaknesses});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Row(
          spacing: 8.w,
          children: [
            Icon(
              Icons.error_outlined,
              color: AppColors.orange.withAlpha(180),
              size: 24.sp,
            ),
            Expanded(
              child: Text(
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                weaknesses[index],
                style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.black,
                ),
              ),
            ),
          ],
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: 16.h),
      itemCount: weaknesses.length,
    );
  }
}