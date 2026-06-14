import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syntra_ai/core/utils/app_assets.dart';
import 'package:syntra_ai/core/utils/app_colors.dart';
import 'package:syntra_ai/core/utils/app_routes.dart';
import 'package:syntra_ai/core/view/widgets/gradient_button_widget.dart';
import 'package:syntra_ai/generated/l10n.dart';

class SuccessfulResetPasswordPage extends StatelessWidget {
  const SuccessfulResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: size.width * 0.4,
                  height: size.height * 0.2,
                  decoration: BoxDecoration(
                    color: isLightMode ? AppColors.gray : AppColors.primary.withAlpha(230),
                    borderRadius: BorderRadius.circular(96.r),
                  ),
                ),
                Image.asset(
                  AppAssets.successfulResetPasswordImage,
                  width: size.width * 0.23,
                ),
              ],
            ),
            SizedBox(height: size.height * 0.02),
            Text(
              S.of(context).successful_reset_password_title1,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
              // style: TextStyle(
              //   fontSize: 22.sp,
              //   fontWeight: FontWeight.w700,
              //   color: AppColors.black,
              // ),
            ),
            SizedBox(height: size.height * 0.01),
            Text(
              S.of(context).successful_reset_password_title2,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
              // style: TextStyle(fontSize: 16.sp, color: AppColors.secondary),
            ),
            SizedBox(height: size.height * 0.04),
            GradientButtonWidget(
              title: S.of(context).successful_reset_password_button,
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  AppRoutes.login, 
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
