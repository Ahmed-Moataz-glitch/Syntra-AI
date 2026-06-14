import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syntra_ai/core/utils/app_colors.dart';

class RolesPhaseWidget extends StatelessWidget {
  final IconData prefixIcon;
  final String title;
  final String description;
  final bool isSelected;
  const RolesPhaseWidget(
      {super.key,
      required this.prefixIcon,
      required this.title,
      required this.description,
      required this.isSelected
    });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    return Container(
      padding: EdgeInsets.only(right: 8.r, top: 8.r),
      height: size.height * 0.12,
      width: size.width * 0.9,
      decoration: BoxDecoration(
        color: isLightMode
        ? null
        : AppColors.primary,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isSelected
            ? isLightMode
              ? AppColors.blue.withAlpha(200)
              : AppColors.blue.withAlpha(200) 
            : AppColors.secondary.withAlpha(110), 
          width: isLightMode
            ? 1.4.r 
            : isSelected
              ? 2.r 
              : 1.4.r
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          isSelected
          ? SizedBox(
            height: size.height * 0.1,
            child: VerticalDivider(
              color: AppColors.blue.withAlpha(200),
              indent: 6.h,
              endIndent: 6.h,
              thickness: 5,
            ),
          )
          : const SizedBox.shrink(),
          Align(
            alignment: Alignment.centerLeft,
            child: Icon(
              prefixIcon,
              color: isSelected
                  ? AppColors.blue.withAlpha(200)
                  : AppColors.purple.withAlpha(200),
              size: 28.sp,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 16.sp,
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                description,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.secondary.withAlpha(170),
                    ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: isSelected
                ? Icon(
                    Icons.arrow_forward_outlined,
                    color: AppColors.blue.withAlpha(200),
                    size: 24.sp,
                )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
