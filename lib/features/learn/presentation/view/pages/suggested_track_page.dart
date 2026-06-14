import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syntra_ai/core/utils/app_colors.dart';
import 'package:syntra_ai/core/utils/app_dialogs.dart';
import 'package:syntra_ai/core/utils/app_routes.dart';
import 'package:syntra_ai/core/utils/app_toast.dart';
import 'package:syntra_ai/core/view/widgets/secondary_gradient_button_widget.dart';
import 'package:syntra_ai/features/learn/domain/entities/generate_roadmap_request_entity.dart';
import 'package:syntra_ai/features/learn/domain/entities/progress_tracking_response_entity.dart';
import 'package:syntra_ai/features/learn/presentation/view/widgets/gradient_text_widget.dart';
import 'package:syntra_ai/features/learn/presentation/view_model/learn_cubit.dart';
import 'package:syntra_ai/generated/l10n.dart';
import 'package:toastification/toastification.dart';

class SuggestedTrackPage extends StatefulWidget {
  final LearnCubit learnCubit;
  final String suggestedTrack;
  const SuggestedTrackPage(
      {super.key, required this.learnCubit, required this.suggestedTrack});

  @override
  State<SuggestedTrackPage> createState() => _SuggestedTrackPageState();
}

class _SuggestedTrackPageState extends State<SuggestedTrackPage> {
  int studyHoursPerWeek = 10;
  ProgressTrackingResponseEntity? progressTrackingRequestEntity;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Suggested Track Page'),
      ),
      body: BlocListener<LearnCubit, LearnState>(
            bloc: widget.learnCubit,
            listenWhen: (previous, current) =>
                current is GenerateRoadmapLoading ||
                current is GenerateRoadmapSuccess ||
                current is GenerateRoadmapError,
            listener: (context, state) {
              if (state is GenerateRoadmapLoading) {
                AppDialogs.showLoadingDialog(context,
                    title: 'Generating roadmap...');
              }
              if (state is GenerateRoadmapSuccess) {
                Navigator.of(context, rootNavigator: true).pop();
                Navigator.of(context).pushReplacementNamed(
                  AppRoutes.roadmap,
                  arguments: {
                    'learnCubit': widget.learnCubit,
                    'generateRoadmapResponseEntity':
                        state.generateRoadmapResponseEntity,
                  },
                );
              }
              if (state is GenerateRoadmapError) {
                Navigator.of(context, rootNavigator: true).pop();
                AppToast.showToast(
                    context: context,
                    title: S.of(context).app_toast_error,
                    description: state.message,
                    type: ToastificationType.error);
              }
            },
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.04),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: isLightMode
                      ? Colors.purple.withAlpha(20)
                      : AppColors.blue.withAlpha(30),
                  border: Border.all(
                    color: isLightMode ? Colors.purple : AppColors.blue,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: GradientTextWidget(
                  text: S.of(context).suggested_track_page_title1,
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                  gradient: LinearGradient(
                    colors: isLightMode
                        ? [Colors.purple, Colors.deepPurple]
                        : [Colors.blueAccent, Colors.purple],
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              GradientTextWidget(
                text: widget.suggestedTrack,
                style: TextStyle(
                  fontSize: 32.sp,
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
                gradient: LinearGradient(
                  colors: [
                    Colors.blue,
                    Colors.purple,
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Divider(
                color: isLightMode
                    ? AppColors.secondary.withAlpha(100)
                    : AppColors.primary.withAlpha(150),
              ),
              SizedBox(height: size.height * 0.02),
              Text(
                'BUILD YOUR ROADMAP',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w800,
                  color: isLightMode
                      ? AppColors.secondary.withAlpha(180)
                      : AppColors.primary.withAlpha(200),
                ),
              ),
              SizedBox(height: size.height * 0.01),
              Text(
                'How many hours can you study per week?',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: isLightMode
                      ? AppColors.black.withAlpha(180)
                      : AppColors.primary.withAlpha(120),
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Row(
                spacing: 16.w,
                children: [
                  Expanded(
                    child: Slider(
                      activeColor: isLightMode
                          ? AppColors.purple.withAlpha(200)
                          : AppColors.blue.withAlpha(220),
                      inactiveColor: isLightMode
                          ? AppColors.purple.withAlpha(30)
                          : AppColors.blue.withAlpha(100),
                      overlayColor: WidgetStatePropertyAll(
                        isLightMode
                            ? AppColors.transparent
                            : AppColors.transparent,
                      ),
                      thumbColor:
                          isLightMode ? AppColors.purple : AppColors.blue,
                      padding: EdgeInsets.zero,
                      min: 1.0,
                      max: 40.0,
                      value: studyHoursPerWeek.toDouble(),
                      onChanged: (value) {
                        setState(() {
                          studyHoursPerWeek = value.round();
                        });
                      },
                    ),
                  ),
                  Text(
                    '${studyHoursPerWeek}h',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: isLightMode
                          ? AppColors.blue
                          : AppColors.primary.withAlpha(200),
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.04),
              Row(
                children: [
                  Expanded(
                    child: SecondaryGradientButtonWidget(
                      title: S.of(context).suggested_track_page_button,
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(AppRoutes.questions);
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.02),
              SecondaryGradientButtonWidget(
                title: 'Generate My Roadmap',
                icon: Icons.arrow_forward,
                onPressed: () async {
                  await widget.learnCubit.generateRoadmap(
                    GenerateRoadmapRequestEntity(
                      trackName: widget.suggestedTrack,
                      hoursPerWeek: studyHoursPerWeek,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
