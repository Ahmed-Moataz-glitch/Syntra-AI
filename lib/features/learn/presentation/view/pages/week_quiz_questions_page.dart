import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syntra_ai/core/utils/app_colors.dart';
import 'package:syntra_ai/core/utils/app_dialogs.dart';
import 'package:syntra_ai/core/utils/app_toast.dart';
import 'package:syntra_ai/core/view/widgets/secondary_gradient_button_widget.dart';
import 'package:syntra_ai/features/learn/domain/entities/extract_key_points_response_entity.dart';
import 'package:syntra_ai/features/learn/domain/entities/generate_quiz_request_entity.dart';
import 'package:syntra_ai/features/learn/domain/entities/generate_roadmap_response_entity.dart';
import 'package:syntra_ai/features/learn/presentation/view/pages/week_quiz_result_page.dart';
import 'package:syntra_ai/features/learn/presentation/view_model/learn_cubit.dart';
import 'package:toastification/toastification.dart';

class WeekQuizQuestionsPage extends StatefulWidget {
  final LearnCubit learnCubit;
  final GenerateRoadmapResponseEntity generateRoadmapResponseEntity;
  final ExtractKeyPointsResponseEntity extractKeyPointsResponseEntity;
  final int weekNumber;
  const WeekQuizQuestionsPage(
      {super.key,
      required this.learnCubit,
      required this.generateRoadmapResponseEntity,
      required this.extractKeyPointsResponseEntity,
      required this.weekNumber});
  @override
  State<WeekQuizQuestionsPage> createState() => _WeekQuizQuestionsPageState();
}

class _WeekQuizQuestionsPageState extends State<WeekQuizQuestionsPage> {
  Map<int, String> selectedAnswers = {};
  int score = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await widget.learnCubit.generateQuiz(
        GenerateQuizRequestEntity(
          trackName: widget.extractKeyPointsResponseEntity.trackName,
          keyPoints: widget.extractKeyPointsResponseEntity.keyPoints,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quiz Questions',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: isLightMode ? AppColors.purple : AppColors.blue,
          ),
        ),
      ),
      body: BlocConsumer<LearnCubit, LearnState>(
        bloc: widget.learnCubit,
        listenWhen: (previous, current) =>
            current is GenerateQuizLoading ||
            current is GenerateQuizSuccess ||
            current is GenerateQuizError,
        buildWhen: (previous, current) => current is GenerateQuizSuccess,
        listener: (context, state) {
          if (state is GenerateQuizLoading) {
            AppDialogs.showLoadingDialog(context,
                title: 'Generating your quiz...');
          }
          if (state is GenerateQuizSuccess) {
            Navigator.of(context, rootNavigator: true).pop();
          }
          if (state is GenerateQuizError) {
            Navigator.of(context, rootNavigator: true).pop();
            AppToast.showToast(
                context: context,
                title: 'Error',
                description: state.message,
                type: ToastificationType.error);
          }
        },
        builder: (context, state) {
          if (state is GenerateQuizSuccess) {
            final generateQuizResponseEntity = state.generateQuizResponseEntity;
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsetsGeometry.symmetric(
                    horizontal: 16.w, vertical: 24.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      generateQuizResponseEntity.quizTitle,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: isLightMode ? AppColors.black : AppColors.primary,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      'Answer all 10 questions. You need 70% to unlock the next week.',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: isLightMode ? AppColors.secondary.withAlpha(200) : AppColors.primary.withAlpha(150),
                      ),
                    ),
                    SizedBox(height: 24.h),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: generateQuizResponseEntity.questions.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 24.h),
                      itemBuilder: (context, index) {
                        final question =
                            generateQuizResponseEntity.questions[index];
                        return Container(
                          padding: EdgeInsets.all(16.w),
                          decoration: BoxDecoration(
                              color: AppColors.purple.withAlpha(12),
                              borderRadius: BorderRadius.circular(12.r),
                              border: Border.all(
                                color: isLightMode ? AppColors.purple.withAlpha(100) : AppColors.blue.withAlpha(100),
                                width: 1.2.r,
                              ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text.rich(
                                TextSpan(
                                  text: 'QUESTION ${index + 1}',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: isLightMode ? AppColors.purple : AppColors.blue,
                                  ),
                                  children: [
                                    TextSpan(
                                      text:
                                          '   ${question.type == 'multiple_choice' ? 'Multiple Choice' : 'True / False'}',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            isLightMode ? AppColors.secondary.withAlpha(180) : AppColors.primary.withAlpha(150),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 8.h),
                              Text(
                                question.questionText,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: isLightMode ? AppColors.black : AppColors.primary,
                                ),
                              ),
                              SizedBox(height: 12.h),
                              ...question.options.map(
                                (option) => Padding(
                                  padding: EdgeInsets.symmetric(vertical: 4.h),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: InkWell(
                                          splashFactory: NoSplash.splashFactory,
                                          onTap: () {
                                            setState(() {
                                              question.selectedAnswer = option;
                                              selectedAnswers[++index] = option;
                                              if (question.selectedAnswer ==
                                                  question.correctAnswer) {
                                                score++;
                                              }
                                            });
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 12.w,
                                              vertical: 8.h,
                                            ),
                                            decoration: BoxDecoration(
                                              color: question.selectedAnswer ==
                                                      option
                                                  ? isLightMode ? AppColors.purple.withAlpha(30) : AppColors.blue
                                                      .withAlpha(20)
                                                  : isLightMode ? AppColors.primary : AppColors.secondary,
                                              border: Border.all(
                                                color:
                                                    question.selectedAnswer ==
                                                            option
                                                        ? isLightMode ? AppColors.purple : AppColors.blue
                                                        : isLightMode ? AppColors.gray : AppColors.secondary
                                                            .withAlpha(150),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.r),
                                            ),
                                            child: Text(
                                              option,
                                              style: TextStyle(
                                                fontSize: 16.sp,
                                                color:
                                                    question.selectedAnswer ==
                                                            option
                                                        ? isLightMode ? AppColors.purple : AppColors.blue
                                                        : isLightMode ? AppColors.black : AppColors.primary
                                                            .withAlpha(200),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 24.h),
                    Row(
                      children: [
                        Expanded(
                          child: SecondaryGradientButtonWidget(
                            title: 'Submit quiz',
                            selectedAnswer:
                                selectedAnswers.length == 10 ? 'ready' : '',
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => WeekQuizResultPage(
                                    generateRoadmapResponseEntity: widget.generateRoadmapResponseEntity,
                                    weekNumber: widget.weekNumber,
                                    score: score,
                                  )
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),
                  ],
                ),
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
