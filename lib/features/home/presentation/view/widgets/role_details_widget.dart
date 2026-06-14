import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syntra_ai/core/utils/app_colors.dart';
import 'package:syntra_ai/core/utils/app_routes.dart';
import 'package:syntra_ai/core/view/widgets/secondary_gradient_button_widget.dart';

class RoleDetailsWidget extends StatelessWidget {
  final IconData mainIcon;
  final String mainTitle;
  final String mainDescription;
  final String secondaryDescription;
  final IconData secondaryIcon1;
  final IconData secondaryIcon2;
  final IconData secondaryIcon3;
  final IconData secondaryIcon4;
  final String secondaryTitle1;
  final String secondaryTitle2;
  final String secondaryTitle3;
  final String secondaryTitle4;
  final String buttonTitle;
  const RoleDetailsWidget({
    super.key,
    required this.mainIcon,
    required this.mainTitle,
    required this.mainDescription,
    required this.secondaryDescription,
    required this.secondaryIcon1,
    required this.secondaryIcon2,
    required this.secondaryIcon3,
    required this.secondaryIcon4,
    required this.secondaryTitle1,
    required this.secondaryTitle2,
    required this.secondaryTitle3,
    required this.secondaryTitle4,
    required this.buttonTitle,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    return Container(
      padding: EdgeInsets.all(16.r),
      width: size.width * 0.9,
      height: size.height * 0.57,
      decoration: BoxDecoration(
        color: isLightMode
            ? null
            : AppColors.primary,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.dividerColor, width: 1.4.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  height: size.height * 0.06,
                  width: size.width * 0.15,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: isLightMode
                          ? [
                              AppColors.blue.withAlpha(50),
                              AppColors.onboardingColor.withAlpha(130),
                            ]
                          : [
                              AppColors.blue.withAlpha(160),
                              AppColors.purple.withAlpha(130),
                            ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Icon(
                    mainIcon,
                    color: AppColors.blue.withBlue(220),
                    size: 40.sp,
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Column(
                spacing: 4.h,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mainTitle,
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black.withAlpha(200),
                        ),
                  ),
                  Text(
                    mainDescription,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w800,
                          color: AppColors.blue.withAlpha(200),
                        ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Divider(
            color: AppColors.dividerColor,
            indent: 16.w,
            endIndent: 16.w,
            thickness: 1.r,
          ),
          SizedBox(height: 16.h),
          Text(
            secondaryDescription,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 15.sp,
                  color: AppColors.secondary.withAlpha(200),
                ),
          ),
          SizedBox(height: 16.h),
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16.h,
              crossAxisSpacing: 16.w,
              childAspectRatio: 3,
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 4,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: isLightMode
                      ? AppColors.secondary.withAlpha(25)
                      : Theme.of(context).primaryColor.withAlpha(20),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Row(
                  spacing: 8.w,
                  children: [
                    Icon(
                      switch (index) {
                        0 => secondaryIcon1,
                        1 => secondaryIcon2,
                        2 => secondaryIcon3,
                        3 => secondaryIcon4,
                        _ => Icons.error,
                      },
                      color: AppColors.blue.withAlpha(200),
                      size: 24.sp,
                    ),
                    Text(
                      switch (index) {
                        0 => secondaryTitle1,
                        1 => secondaryTitle2,
                        2 => secondaryTitle3,
                        3 => secondaryTitle4,
                        _ => '',
                      },
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w800,
                            color: AppColors.black.withAlpha(170),
                          ),
                    ),
                  ],
                ),
              );
            },
          ),
          SizedBox(height: 16.h),
          SizedBox(
            width: size.width * 0.75,
            child: SecondaryGradientButtonWidget(
              title: buttonTitle,
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.roles);
              },
              icon: Icons.arrow_forward,
            ),
          ),
        ],
      ),
    );
  }
}
