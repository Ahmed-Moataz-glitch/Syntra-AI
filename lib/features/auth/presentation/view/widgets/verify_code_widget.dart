import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:syntra_ai/core/utils/app_colors.dart';

class VerifyCodeWidget extends StatefulWidget {
  final PinInputController pinController;
  const VerifyCodeWidget({super.key, required this.pinController});

  @override
  State<VerifyCodeWidget> createState() => _VerifyCodeWidgetState();
}

class _VerifyCodeWidgetState extends State<VerifyCodeWidget> {
  @override
  Widget build(BuildContext context) {
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    return MaterialPinField(
      pinController: widget.pinController,
      length: 6,
      theme: MaterialPinTheme(
        fillColor: AppColors.primary,
        focusedFillColor:  AppColors.blue.withAlpha(30),
        focusedBorderColor: isLightMode ? AppColors.blue : AppColors.purple,
        filledFillColor: AppColors.blue.withAlpha(30),
        filledBorderColor: !isLightMode ? null : AppColors.blue,
        followingFillColor: AppColors.primary,
        followingBorderColor: isLightMode ? AppColors.secondary.withAlpha(100) : null,
        completeFillColor: AppColors.blue.withAlpha(30),
        completeBorderColor: isLightMode ? AppColors.blue : AppColors.purple,
        cursorColor: isLightMode ? AppColors.blue : AppColors.purple,
        borderColor: !isLightMode ? null : AppColors.secondary.withAlpha(100),
        borderWidth: isLightMode ? 1.5 : 2,
        textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
          color: isLightMode ? null : AppColors.purple,
          fontSize: 22.sp,
        ),
        // textStyle: TextStyle(
        //   fontSize: 20.sp,
        //   fontWeight: FontWeight.w500,
        //   color: AppColors.blue,
        // ),
        errorBorderColor: AppColors.red,
        errorTextStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.red,
        ),
      ),
      onCompleted: (String value) {
        debugPrint('Completed: $value');
      },
    );
  }
}