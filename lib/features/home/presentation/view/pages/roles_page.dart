import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syntra_ai/core/utils/app_colors.dart';
import 'package:syntra_ai/core/utils/app_localization.dart';
import 'package:syntra_ai/core/view/widgets/logo_widget.dart';
import 'package:syntra_ai/features/home/presentation/view/widgets/role_details_widget.dart';
import 'package:syntra_ai/features/home/presentation/view/widgets/roles_phase_widget.dart';
import 'package:syntra_ai/generated/l10n.dart';

class RolesPage extends StatefulWidget {
  const RolesPage({super.key});

  @override
  State<RolesPage> createState() => _RolesPageState();
}

class _RolesPageState extends State<RolesPage> {
  bool learnerSelected = true;
  bool teamSelected = false;
  bool recruiterSelected = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    final isArabic = AppLocalization.isArabic();
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
                    border: Border.all(
                      color: AppColors.dividerColor,
                      width: isLightMode ? 1.4.r : 0,
                    ),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Text(
                    S.of(context).roles_page_title1,
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
                S.of(context).roles_page_title2,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontSize: 35.sp,
                      color: isLightMode ? AppColors.black : AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(height: size.height * 0.006),
              Container(
                margin: isArabic
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
                  S.of(context).roles_page_title3,
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
                S.of(context).roles_page_title4,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontSize: 16.sp,
                      color:
                          isLightMode ? null : AppColors.primary.withAlpha(170),
                    ),
              ),
              // SizedBox(height: size.height * 0.03),
              // SizedBox(
              //   width: size.width * 0.5,
              //   child: SecondaryGradientButtonWidget(
              //     title: S.of(context).work_flow_page_button,
              //     onPressed: (){

              //     },
              //     icon: Icons.arrow_forward,),
              // ),
              SizedBox(height: size.height * 0.03),
              InkWell(
                splashFactory: NoSplash.splashFactory,
                onTap: () {
                  learnerSelected = true;
                  teamSelected = false;
                  recruiterSelected = false;
                  setState(() {});
                },
                child: RolesPhaseWidget(
                  prefixIcon: Icons.school_outlined,
                  title: S.of(context).roles_page_role1_title,
                  description: S.of(context).roles_page_role1_description,
                  isSelected: learnerSelected,
                ),
              ),
              SizedBox(height: size.height * 0.03),
              InkWell(
                splashFactory: NoSplash.splashFactory,
                onTap: () {
                  learnerSelected = false;
                  teamSelected = true;
                  recruiterSelected = false;
                  setState(() {});
                },
                child: RolesPhaseWidget(
                  prefixIcon: Icons.group_outlined,
                  title: S.of(context).roles_page_role2_title,
                  description: S.of(context).roles_page_role2_description,
                  isSelected: teamSelected,
                ),
              ),
              SizedBox(height: size.height * 0.03),
              InkWell(
                splashFactory: NoSplash.splashFactory,
                onTap: () {
                  learnerSelected = false;
                  teamSelected = false;
                  recruiterSelected = true;
                  setState(() {});
                },
                child: RolesPhaseWidget(
                  prefixIcon: Icons.business_center_outlined,
                  title: S.of(context).roles_page_role3_title,
                  description: S.of(context).roles_page_role3_description,
                  isSelected: recruiterSelected,
                ),
              ),
              SizedBox(height: size.height * 0.03),
              teamSelected
                  ? RoleDetailsWidget(
                      mainIcon: Icons.group_outlined,
                      mainTitle:
                          S.of(context).roles_page_role2_details_main_title,
                      mainDescription: S
                          .of(context)
                          .roles_page_role2_details_main_description,
                      secondaryDescription: S
                          .of(context)
                          .roles_page_role2_details_secondary_description,
                      secondaryIcon1: Icons.smart_toy_outlined,
                      secondaryIcon2: Icons.import_contacts_outlined,
                      secondaryIcon3: Icons.bar_chart_outlined,
                      secondaryIcon4: Icons.dashboard_outlined,
                      secondaryTitle1: S
                          .of(context)
                          .roles_page_role2_details_secondary_title1,
                      secondaryTitle2: S
                          .of(context)
                          .roles_page_role2_details_secondary_title2,
                      secondaryTitle3: S
                          .of(context)
                          .roles_page_role2_details_secondary_title3,
                      secondaryTitle4: S
                          .of(context)
                          .roles_page_role2_details_secondary_title4,
                      buttonTitle:
                          S.of(context).roles_page_role2_details_button,
                    )
                  : recruiterSelected
                      ? RoleDetailsWidget(
                          mainIcon: Icons.business_center_outlined,
                          mainTitle:
                              S.of(context).roles_page_role3_details_main_title,
                          mainDescription: S
                              .of(context)
                              .roles_page_role3_details_main_description,
                          secondaryDescription: S
                              .of(context)
                              .roles_page_role3_details_secondary_description,
                          secondaryIcon1: Icons.tune_outlined,
                          secondaryIcon2: Icons.dns_outlined,
                          secondaryIcon3: Icons.business_outlined,
                          secondaryIcon4: Icons.verified_outlined,
                          secondaryTitle1: S
                              .of(context)
                              .roles_page_role3_details_secondary_title1,
                          secondaryTitle2: S
                              .of(context)
                              .roles_page_role3_details_secondary_title2,
                          secondaryTitle3: S
                              .of(context)
                              .roles_page_role3_details_secondary_title3,
                          secondaryTitle4: S
                              .of(context)
                              .roles_page_role3_details_secondary_title4,
                          buttonTitle:
                              S.of(context).roles_page_role3_details_button,
                        )
                      : RoleDetailsWidget(
                          mainIcon: Icons.school_outlined,
                          mainTitle:
                              S.of(context).roles_page_role1_details_main_title,
                          mainDescription: S
                              .of(context)
                              .roles_page_role1_details_main_description,
                          secondaryDescription: S
                              .of(context)
                              .roles_page_role1_details_secondary_description,
                          secondaryIcon1: Icons.map_outlined,
                          secondaryIcon2: Icons.assignment_outlined,
                          secondaryIcon3: Icons.verified_user_outlined,
                          secondaryIcon4: Icons.rocket_launch_outlined,
                          secondaryTitle1: S
                              .of(context)
                              .roles_page_role1_details_secondary_title1,
                          secondaryTitle2: S
                              .of(context)
                              .roles_page_role1_details_secondary_title2,
                          secondaryTitle3: S
                              .of(context)
                              .roles_page_role1_details_secondary_title3,
                          secondaryTitle4: S
                              .of(context)
                              .roles_page_role1_details_secondary_title4,
                          buttonTitle:
                              S.of(context).roles_page_role1_details_button,
                        ),
            ],
          ),
        ),
      ),
    );
  }
}
