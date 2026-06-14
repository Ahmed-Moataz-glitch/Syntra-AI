import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:syntra_ai/core/utils/app_assets.dart';
import 'package:syntra_ai/core/utils/app_colors.dart';
import 'package:syntra_ai/features/auth/presentation/view/pages/login_page.dart';
import 'package:syntra_ai/core/view/widgets/gradient_button_widget.dart';
import 'package:syntra_ai/generated/l10n.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late final PageController controller;
  int index = 0;

  @override
  initState() {
    super.initState();
    controller = PageController();
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    List<OnboardingModel> onboardingList = [
      OnboardingModel(
        title: S.of(context).onboarding_page1_title1,
        description: S.of(context).onboarding_page1_title2,
        imagePath: AppAssets.syntraAiLottie,
      ),
      OnboardingModel(
        title: S.of(context).onboarding_page2_title1,
        description: S.of(context).onboarding_page2_title2,
        imagePath: AppAssets.learnerLottie,
      ),
      OnboardingModel(
        title: S.of(context).onboarding_page3_title1,
        description: S.of(context).onboarding_page3_title2,
        imagePath: AppAssets.teamLottie,
      ),
      OnboardingModel(
        title: S.of(context).onboarding_page4_title1,
        description: S.of(context).onboarding_page4_title2,
        imagePath: AppAssets.employerLottie,
      ),
    ];
    return Scaffold(
      // backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //! image onboarding
              SizedBox(
                height: size.height * 0.3,
                child: PageView.builder(
                  controller: controller,
                  onPageChanged: (value) {
                    setState(() {
                      index = value;
                    });
                  },
                  itemBuilder: (context, index) => CustomAnimatedWidget(
                    delay: index,
                    index: index,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: 
                      !isLightMode
                      ? Container(
                        padding: EdgeInsets.all(12.r),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withAlpha(230),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Lottie.asset(
                          onboardingList[index].imagePath,
                          height: size.height * 0.2,
                          fit: index == 1 ? BoxFit.cover : BoxFit.contain,
                        ),
                      )
                      : Lottie.asset(
                        onboardingList[index].imagePath,
                        height: size.height * 0.2,
                        fit: index == 1 ? BoxFit.cover : BoxFit.contain,
                      ),
                    ),
                  ),
                  itemCount: onboardingList.length,
                ),
              ),
              SizedBox(height: 35.h),
              //! indicator onboarding
              SmoothPageIndicator(
                controller: controller,
                count: onboardingList.length,
                axisDirection: Axis.horizontal,
                effect: ExpandingDotsEffect(
                  dotWidth: 10.r,
                  dotHeight: 10.r,
                  dotColor: AppColors.dividerColor.withAlpha(80),
                  activeDotColor: AppColors.blue,
                ),
              ),
              //! title onboarding and description onboarding
              SizedBox(height: 50.h),
              CustomAnimatedWidget(
                delay: (index + 1) * 100,
                index: index,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 40.w),
                  width: double.infinity,
                  child: Column(
                    children: [
                      Text(
                        onboardingList[index].title,
                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: !isLightMode ? AppColors.blue : AppColors.blue,
                        ),
                        // style: TextStyle(
                          // fontSize: 32.sp,
                          // fontWeight: FontWeight.bold,
                          // color: AppColors.blue,
                        // ),
                      ),
                      SizedBox(height: size.height * 0.03),
                      index == 0
                          ? SizedBox(
                              width: size.width,
                              child: DefaultTextStyle(
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                  color: isLightMode ? null : AppColors.primary,
                                ),
                                child: AnimatedTextKit(
                                  animatedTexts: [
                                    TypewriterAnimatedText(
                                      textAlign: TextAlign.center,
                                      onboardingList[index].description,
                                      speed: Duration(milliseconds: 100),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Text(
                              onboardingList[index].description,
                              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                color: isLightMode ? null : AppColors.primary,
                              ),
                              textAlign: TextAlign.center,
                            ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 100.h),
              //! button next onboarding
              GradientButtonWidget(
                title: index < onboardingList.length - 1
                    ? S.of(context).onboarding_page_button_case1
                    : S.of(context).onboarding_page_button_case2,
                onPressed: () {
                  if (index < onboardingList.length - 1) {
                    controller.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn,
                    );
                  } else {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// data class
class OnboardingData {
  final String title;
  final String description;
  final String image;
  OnboardingData({
    required this.title,
    required this.description,
    required this.image,
  });
}

// data onboarding
class OnboardingModel {
  final String title;
  final String description;
  final String imagePath;

  OnboardingModel({
    required this.title,
    required this.description,
    required this.imagePath,
  });
}

class CustomAnimatedWidget extends StatelessWidget {
  const CustomAnimatedWidget({
    super.key,
    required this.index,
    required this.delay,
    required this.child,
  });
  final int index;
  final int delay;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (index == 1) {
      return FadeInDown(
        delay: Duration(milliseconds: delay),
        child: child,
      );
    }
    return FadeInUp(
      delay: Duration(milliseconds: delay),
      child: child,
    );
  }
}
