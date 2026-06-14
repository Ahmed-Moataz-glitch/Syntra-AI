import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syntra_ai/core/utils/app_assets.dart';
import 'package:syntra_ai/core/utils/app_colors.dart';
import 'package:syntra_ai/generated/l10n.dart';

class GradientButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const GradientButtonWidget({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        width: size.width,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [AppColors.gradientColor1, AppColors.gradientColor2],
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 6.w,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
              // style: TextStyle(
              //   fontSize: 18.sp,
              //   fontWeight: FontWeight.w800,
              //   color: AppColors.primary,
              // ),
            ),
            title == S.of(context).login_button || title == S.of(context).signup_button 
            ? 
            SvgPicture.asset(AppAssets.signinIcon)
            :
            const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
