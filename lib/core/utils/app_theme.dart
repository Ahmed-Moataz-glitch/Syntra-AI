import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syntra_ai/core/utils/app_colors.dart';

abstract class AppTheme {
  static ThemeData light = ThemeData(
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
    primaryColor: AppColors.blue,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.transparent,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
      ),
      // actionsPadding: EdgeInsets.only(right: 16.w),
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.black,
        overflow: TextOverflow.ellipsis,
      ),
      filled: true,
      fillColor: AppColors.fillColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide.none,
      ),
      hintStyle: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.hintTextColor,
        overflow: TextOverflow.ellipsis,
      ),
    ),
    dividerTheme: DividerThemeData(
      color: AppColors.primary,
      thickness: 1,
      indent: 8.w,
      endIndent: 10.w,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.primary,
      selectedItemColor: AppColors.blue,
      unselectedItemColor: AppColors.secondary.withAlpha(170),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedLabelStyle: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 14.sp,
        color: AppColors.blue,
      ),
      unselectedLabelStyle: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 14.sp,
        color: AppColors.secondary.withAlpha(170),
      ),
      // type: BottomNavigationBarType.fixed,
    ),
    textTheme: TextTheme(
      headlineSmall: TextStyle(
        fontSize: 32.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.blue,
      ),
      titleSmall: TextStyle(
        fontSize: 20.sp,
        color: AppColors.purple,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.black.withAlpha(170),
      ),
      titleLarge: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w800,
        color: AppColors.primary,
      ),
      displayMedium: TextStyle(
        fontSize: 32.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.black,
      ),
      displayLarge: TextStyle(
        fontSize: 32.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.purple,
      ),
      headlineLarge: TextStyle(
        fontSize: 32.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.black,
      ),
      headlineMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.secondary,
      ),
      bodyMedium: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.black,
      ),
      bodySmall: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.blue,
      ),
      bodyLarge: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.semiBlack,
      ),
      displaySmall: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.black,
      ),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.blue,
    ),
  );
  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,

    // If you don’t have these in AppColors yet, create them (recommended)
    // darkScaffoldBackgroundColor, darkSurfaceColor, white
    scaffoldBackgroundColor: AppColors.dark,
    primaryColor: AppColors.blue,

    colorScheme: ColorScheme.dark(
      primary: AppColors.blue,
      secondary: AppColors.gray,
      surface: AppColors.dark,
      onSurface: AppColors.primary,
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.transparent,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.primary, // was black
      ),
      iconTheme: const IconThemeData(color: AppColors.primary),
    ),

    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.blue, // was black
        overflow: TextOverflow.ellipsis,
      ),
      filled: true,
      fillColor: AppColors.primary.withAlpha(230), // was fillColor (light)
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide.none,
      ),
      hintStyle: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.black, // was hintTextColor (light)
        overflow: TextOverflow.ellipsis,
      ),
    ),

    dividerTheme: DividerThemeData(
      color: AppColors.primary.withAlpha(30), // was dividerColor (light)
      thickness: 1,
      indent: 8.w,
      endIndent: 10.w,
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.dark, // was AppColors.primary (light)
      selectedItemColor: AppColors.blue,
      unselectedItemColor: AppColors.primary.withAlpha(170), // was secondary
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedLabelStyle: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 14.sp,
        color: AppColors.blue,
      ),
      unselectedLabelStyle: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 14.sp,
        color: AppColors.primary.withAlpha(170),
      ),
    ),
    fontFamily: 'NotoSansArabic',
    textTheme: TextTheme(
      headlineSmall: TextStyle(
        fontSize: 32.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.blue,
      ),
      titleSmall: TextStyle(
        fontSize: 20.sp,
        color: AppColors.purple,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.primary.withAlpha(170), // was black.withAlpha(170)
      ),
      titleLarge: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w800,
        color: AppColors.primary, // was AppColors.primary (light)
      ),
      displayMedium: TextStyle(
        fontSize: 32.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.primary, // was black
      ),
      displayLarge: TextStyle(
        fontSize: 32.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.purple,
      ),
      headlineLarge: TextStyle(
        fontSize: 32.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.primary, // was black
      ),
      headlineMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.primary.withAlpha(120), // was secondary
      ),
      bodyMedium: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.primary, // was black
      ),
      bodySmall: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.blue,
      ),
      bodyLarge: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.primary.withAlpha(200), // was semiBlack
      ),
      displaySmall: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.primary, // was black
      ),
    ),

    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.blue,
    ),
  );
}
