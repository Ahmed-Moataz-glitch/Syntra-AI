import 'package:flutter/material.dart';
import 'package:syntra_ai/core/utils/app_assets.dart';
import 'package:syntra_ai/core/utils/app_colors.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.splashScreenColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppAssets.onboardingImage, fit: BoxFit.contain),
            SizedBox(height: size.height * 0.1),
            GestureDetector(
              onTap: () => Navigator.of(context).pushReplacementNamed('/login'),
              child: Container(
                width: 60,
                height: 60,
                decoration: const BoxDecoration(
                  color: AppColors.blue,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_forward,
                  size: 35,
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
