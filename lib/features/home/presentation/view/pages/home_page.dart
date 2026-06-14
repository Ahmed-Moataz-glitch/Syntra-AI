import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syntra_ai/core/utils/app_colors.dart';
import 'package:syntra_ai/core/utils/app_localization.dart';
import 'package:syntra_ai/core/utils/app_routes.dart';
import 'package:syntra_ai/core/view/widgets/logo_widget.dart';
import 'package:syntra_ai/core/view/widgets/secondary_gradient_button_widget.dart';
import 'package:syntra_ai/features/home/presentation/view/widgets/our_features_widget.dart';
import 'package:syntra_ai/generated/l10n.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          width: size.width * 0.445,
          height: size.height * 0.07,
          child: const LogoWidget(),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.transparent,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  text: AppLocalization.isArabic()
                      ? '${S.of(context).home_page_title1} '
                      : S.of(context).home_page_title1,
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontSize: 26.sp,
                      ),
                  // style: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.bold),
                  children: [
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Container(
                        margin: AppLocalization.isArabic()
                            ? EdgeInsets.only(left: 8.w)
                            : null,
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            stops: [0.1, 0.8],
                            colors: [
                              AppColors.blue.withValues(alpha: 170, blue: 120),
                              AppColors.purple.withValues(
                                alpha: 170,
                                blue: 150,
                              ),
                            ],
                            transform: const GradientRotation(0.2),
                          ),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Text(
                          S.of(context).home_page_title2,
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontSize: 24.sp,
                                  ),
                          // style: TextStyle(
                          // fontSize: 24.sp,
                          //   fontWeight: FontWeight.bold,
                          //   color: AppColors.primary,
                          // ),
                        ),
                      ),
                    ),
                    TextSpan(
                      text: S.of(context).home_page_title3,
                      style:
                          Theme.of(context).textTheme.headlineLarge!.copyWith(
                                fontSize: 26.sp,
                              ),
                      // style: TextStyle(
                      //   fontSize: 26.sp,
                      //   fontWeight: FontWeight.w700,
                      // ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Text(
                S.of(context).home_page_title4,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontSize: 16.sp,
                      color:
                          isLightMode ? null : AppColors.primary.withAlpha(170),
                    ),
                // style: TextStyle(
                //   fontSize: 16.sp,
                //   fontWeight: FontWeight.w500,
                //   color: AppColors.secondary.withValues(alpha: 90),
                // ),
              ),
              SizedBox(height: size.height * 0.03),
              MainButtons(),
              SizedBox(height: size.height * 0.03),
              Divider(
                color: isLightMode
                    ? AppColors.dividerColor.withValues(alpha: 100)
                    : AppColors.primary.withAlpha(60),
                // indent: 16.w,
                // endIndent: 16.w,
                // color: AppColors.secondary.withAlpha(80),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 4.h,
                ),
                decoration: BoxDecoration(
                  color: AppColors.blue.withBlue(200).withAlpha(60),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  S.of(context).home_page_title5,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 16.sp,
                        color: isLightMode
                            ? null
                            : AppColors.primary.withAlpha(220),
                        fontWeight: FontWeight.w600,
                      ),
                  // style: TextStyle(
                  //   fontSize: 16.sp,
                  //   fontWeight: FontWeight.bold,
                  //   color: AppColors.blue,
                  // ),
                ),
              ),
              SizedBox(height: size.height * 0.03),
              OurFeaturesWidget(title: S.of(context).home_page_feature1),
              SizedBox(height: size.height * 0.02),
              OurFeaturesWidget(title: S.of(context).home_page_feature2),
              SizedBox(height: size.height * 0.02),
              OurFeaturesWidget(title: S.of(context).home_page_feature3),
              SizedBox(height: size.height * 0.02),
              OurFeaturesWidget(title: S.of(context).home_page_feature4),
            ],
          ),
        ),
      ),
    );
  }
}

class MainButtons extends StatelessWidget {
  const MainButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    return Row(
      spacing: 24.w,
      children: [
        Expanded(
          child: SecondaryGradientButtonWidget(
            title: S.of(context).home_page_button1,
            onPressed: (){
              Navigator.of(context, rootNavigator: true).pushNamed(AppRoutes.workFlow);
            },
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                color: AppColors.primary,
                boxShadow: isLightMode
                    ? [
                        BoxShadow(
                          color: AppColors.dividerColor.withValues(alpha: 100),
                          blurRadius: 4,
                          spreadRadius: 0.3,
                          offset: const Offset(-2, 3),
                        ),
                      ]
                    : null,
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: Text(
                S.of(context).home_page_button2,
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontSize: 18.sp,
                      color:
                          isLightMode ? null : AppColors.purple.withAlpha(220),
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
                // style: TextStyle(
                //   fontSize: 18.sp,
                //   fontWeight: FontWeight.bold,
                //   color: AppColors.purple,
                // ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
