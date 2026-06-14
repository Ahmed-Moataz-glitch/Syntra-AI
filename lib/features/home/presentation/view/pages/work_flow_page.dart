import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syntra_ai/core/utils/app_colors.dart';
import 'package:syntra_ai/core/utils/app_localization.dart';
import 'package:syntra_ai/core/utils/app_routes.dart';
import 'package:syntra_ai/core/view/widgets/logo_widget.dart';
import 'package:syntra_ai/core/view/widgets/secondary_gradient_button_widget.dart';
import 'package:syntra_ai/features/home/presentation/view/widgets/work_flow_phase_widget.dart';
import 'package:syntra_ai/generated/l10n.dart';

class WorkFlowPage extends StatelessWidget {
  const WorkFlowPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    return Scaffold(
      backgroundColor: isLightMode ? AppColors.primary : AppColors.dark,
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
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: size.height * 0.03),
              Align(
                alignment: Alignment.center,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 4.h, horizontal: 16.w),
                  decoration: BoxDecoration(
                    color: isLightMode
                        ? AppColors.secondary.withAlpha(15)
                        : AppColors.primary,
                    border:
                        Border.all(
                          color: AppColors.dividerColor, 
                          width: isLightMode ? 1.4.r : 0,
                        ),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Text(
                    S.of(context).work_flow_page_title1,
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: isLightMode ? null : AppColors.blue,
                        ),
                    textAlign: TextAlign.center,
                    // style: TextStyle(fontSize: 16.sp, color: AppColors.purple, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Text(
                S.of(context).work_flow_page_title2,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontSize: 35.sp,
                      color: isLightMode ? AppColors.black : AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(height: size.height * 0.006),
              Container(
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
                  S.of(context).work_flow_page_title3,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 28.sp,
                      ),
                  // style: TextStyle(
                  // fontSize: 24.sp,
                  //   fontWeight: FontWeight.bold,
                  //   color: AppColors.primary,
                  // ),
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Text(
                S.of(context).work_flow_page_title4,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontSize: 16.sp,
                      color:
                          isLightMode ? null : AppColors.primary.withAlpha(170),
                    ),
              ),
              SizedBox(height: size.height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    spacing: size.height * 0.01,
                    children: [
                      Text(
                        '04',
                        style:
                            Theme.of(context).textTheme.displayMedium!.copyWith(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      Text(
                        S.of(context).work_flow_page_title5,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                              fontSize: 14.sp,
                              color: isLightMode
                                  ? null
                                  : AppColors.primary.withAlpha(170),
                            ),
                      ),
                    ],
                  ),
                  Column(
                    spacing: size.height * 0.01,
                    children: [
                      Text(
                        '∞',
                        style:
                            Theme.of(context).textTheme.displayMedium!.copyWith(
                                  fontSize: 28.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      Text(
                        S.of(context).work_flow_page_title6,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                              fontSize: 14.sp,
                              color: isLightMode
                                  ? null
                                  : AppColors.primary.withAlpha(170),
                            ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.03),
              SizedBox(
                width: size.width * 0.55,
                child: SecondaryGradientButtonWidget(
                  title: S.of(context).work_flow_page_button,
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.roles);
                  },
                  icon: Icons.arrow_forward,
                ),
              ),
              SizedBox(height: size.height * 0.03),
              WorkFlowPhaseWidget(
                prefixIcon: Icons.analytics_outlined,
                title: S.of(context).work_flow_page_phase1_title,
                description: S.of(context).work_flow_page_phase1_description,
                phaseNumber: 1,
              ),
              SizedBox(height: size.height * 0.03),
              WorkFlowPhaseWidget(
                prefixIcon: Icons.map_outlined,
                title: S.of(context).work_flow_page_phase2_title,
                description: S.of(context).work_flow_page_phase2_description,
                phaseNumber: 2,
              ),
              SizedBox(height: size.height * 0.03),
              WorkFlowPhaseWidget(
                prefixIcon: Icons.code_outlined,
                title: S.of(context).work_flow_page_phase3_title,
                description: S.of(context).work_flow_page_phase3_description,
                phaseNumber: 3,
              ),
              SizedBox(height: size.height * 0.03),
              WorkFlowPhaseWidget(
                prefixIcon: Icons.verified_outlined,
                title: S.of(context).work_flow_page_phase4_title,
                description: S.of(context).work_flow_page_phase4_description,
                phaseNumber: 4,
              ),
              SizedBox(height: size.height * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
