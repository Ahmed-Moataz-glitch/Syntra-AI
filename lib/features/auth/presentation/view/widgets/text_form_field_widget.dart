// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syntra_ai/core/utils/app_assets.dart';
import 'package:syntra_ai/core/utils/app_colors.dart';

class TextFormFieldWidget extends StatefulWidget {
  final TextInputType keyboardType;
  final String? hintText;
  bool obscureText;
  final bool isEmail;
  final bool isPassword;
  final bool isFullName;
  final TextEditingController controller;
  final String? Function(String?) validator;

  TextFormFieldWidget({
    required this.controller,
    required this.validator,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.isEmail = false,
    this.isPassword = false,
    this.isFullName = false,
    super.key,
  });

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    return TextFormField(
      maxLines: widget.hintText!.contains('This app') ? 5 : 1,
      onChanged: (value) => widget.controller.text = value,
      obscureText: widget.obscureText,
      obscuringCharacter: '*',
      style: Theme.of(context).inputDecorationTheme.hintStyle!.copyWith(
            fontSize: isLightMode ? 16.sp : 16.sp,
            color: isLightMode ? AppColors.blue : AppColors.blue,
            fontWeight: isLightMode ? FontWeight.w700 : FontWeight.w700,
          ),
      cursorColor: AppColors.blue,
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      decoration: InputDecoration(
        fillColor: isLightMode ? AppColors.blue.withAlpha(35) : AppColors.primary,
        hintText: widget.hintText,
        hintStyle: Theme.of(context).inputDecorationTheme.hintStyle!.copyWith(
              color: isLightMode ? null : AppColors.black,
            ),
        prefixIcon: widget.isPassword
            ? Padding(
                padding: EdgeInsets.all(8.r),
                child: SvgPicture.asset(
                  AppAssets.passwordIcon,
                  colorFilter: ColorFilter.mode(
                    isLightMode
                        ? AppColors.black.withAlpha(190)
                        : AppColors.black.withAlpha(190),
                    BlendMode.srcIn,
                  ),
                ),
              )
            : widget.isFullName
                ? Padding(
                    padding: EdgeInsets.all(8.r),
                    child: Icon(
                      Icons.person_outline,
                      size: 32.sp,
                      color:
                          isLightMode ? null : AppColors.black.withAlpha(190),
                    ),
                  )
                : widget.isEmail
                    ? Padding(
                        padding: EdgeInsets.all(8.r),
                        child: SvgPicture.asset(
                          AppAssets.emailIcon,
                        ),
                      )
                    : null,
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  widget.obscureText ? Icons.visibility_off : Icons.visibility,
                  color: const Color(0xff454A4F),
                  size: 24.sp,
                ),
                onPressed: () {
                  setState(() {
                    widget.obscureText = !widget.obscureText;
                  });
                },
              )
            : null,

        // contentPadding: const EdgeInsets.only(left: 8, right: 8, top: 16, bottom: 8),
        enabledBorder: isLightMode
            ? outlineInputBorder(
                color: AppColors.secondary.withAlpha(150),
                radius: 10.r,
                width: 1.2.r,
              )
            : null,
        focusedBorder: outlineInputBorder(
          color: AppColors.blue.withAlpha(200),
          radius: 10.r,
          width: 1.5.r,
        ),
        // errorBorder: outlineInputBorder(
        //   color: Colors.red,
        //   radius: 10,
        //   width: 1,
        // ),
        // focusedErrorBorder: outlineInputBorder(
        //   color: Colors.red,
        //   radius: 10,
        //   width: 1,
        // ),
      ),
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      validator: widget.validator,
    );
  }

  OutlineInputBorder outlineInputBorder({
    required double radius,
    required Color color,
    required double width,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide(
        color: color, 
        width: width,
        strokeAlign: BorderSide.strokeAlignOutside,
      ),
    );
  }
}
