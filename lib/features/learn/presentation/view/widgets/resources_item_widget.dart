import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syntra_ai/core/utils/app_colors.dart';

class ResourcesItemWidget extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String link;
  final VoidCallback? onPressed;
  const ResourcesItemWidget({super.key, required this.icon, required this.iconColor, required this.title, required this.link, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(12.r),
        decoration: BoxDecoration(
          color: AppColors.transparent,
          border: Border.all(
            color: AppColors.secondary.withAlpha(100),
            width: 1.2.r,
          ),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          spacing: 12.w,
          children: [
            Container(
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                color: iconColor.withAlpha(20),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(
                icon,
                color: iconColor,
                size: 28.sp,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 4.h,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.semiBlack.withAlpha(150),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    link,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.open_in_new_outlined,
              color: AppColors.gray.withAlpha(200),
              size: 24.sp,
            ),
          ],
        ),
      ),
    );
  }
}
