import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syntra_ai/core/utils/app_colors.dart';
import 'package:syntra_ai/generated/l10n.dart';

class WorkFlowPhaseWidget extends StatelessWidget {
  final IconData prefixIcon;
  final String title;
  final String description;
  final int phaseNumber;
  const WorkFlowPhaseWidget(
      {super.key,
      required this.prefixIcon,
      required this.title,
      required this.description,
      required this.phaseNumber});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    return Container(
      height: size.height * 0.18,
      width: size.width * 0.9,
      decoration: BoxDecoration(
        color: isLightMode ? AppColors.purple.withAlpha(10) : AppColors.primary.withAlpha(230),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: Container(
                width: 5.w,
                color: phaseNumber % 2 == 0
                    ? AppColors.blue.withAlpha(200)
                    : AppColors.purple.withAlpha(200),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.h, right: 8.w, left: 16.w, bottom: 8.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(
                      prefixIcon,
                      color: phaseNumber % 2 == 0
                          ? AppColors.blue.withAlpha(200)
                          : AppColors.purple.withAlpha(200),
                      size: 28.sp,
                    ),
                  ),
                  Column(
                    spacing: 6.h,
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
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 14.sp,
                              color: AppColors.secondary.withAlpha(170),
                            ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      switch (phaseNumber) {
                        1 => S.of(context).work_flow_page_phase1,
                        2 => S.of(context).work_flow_page_phase2,
                        3 => S.of(context).work_flow_page_phase3,
                        4 => S.of(context).work_flow_page_phase4,
                        _ => '',
                      },
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w800,
                            color: phaseNumber % 2 == 0
                                ? AppColors.blue.withAlpha(200)
                                : AppColors.purple.withAlpha(200),
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
