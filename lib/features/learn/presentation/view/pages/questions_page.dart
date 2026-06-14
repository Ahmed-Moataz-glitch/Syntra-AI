import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syntra_ai/core/utils/app_colors.dart';
import 'package:syntra_ai/core/utils/app_dialogs.dart';
import 'package:syntra_ai/core/utils/app_routes.dart';
import 'package:syntra_ai/core/utils/app_toast.dart';
import 'package:syntra_ai/features/learn/domain/entities/answer_request_entity.dart';
import 'package:syntra_ai/features/learn/presentation/view/widgets/answers_widget.dart';
import 'package:syntra_ai/features/learn/presentation/view_model/learn_cubit.dart';
import 'package:syntra_ai/generated/l10n.dart';
import 'package:toastification/toastification.dart';

class QuestionsPage extends StatefulWidget {
  final LearnCubit learnCubit;
  const QuestionsPage({super.key, required this.learnCubit});

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  AnswerRequestEntity answerRequestEntity =
      AnswerRequestEntity(sessionId: '', selectedAnswer: '');
  bool isFirstQuestion = true;
  late final PageController pageController;
  double progress = 0;

  @override
  void initState() {
    super.initState();
    if (isFirstQuestion) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await widget.learnCubit.startSession();
      });
      isFirstQuestion = false;
    }
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Questions Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: PageView.builder(
          controller: pageController,
          itemCount: 10,
          itemBuilder: (context, index) {
            if (progress < size.width) {
              progress += size.width * 0.1;
            }
            return index == 0
                ? BlocConsumer<LearnCubit, LearnState>(
                    bloc: widget.learnCubit,
                    listenWhen: (previous, current) =>
                        current is StartSessionLoading ||
                        current is StartSessionError,
                    listener: (context, state) {
                      if (state is StartSessionLoading) {
                        return AppDialogs.showLoadingDialog(context,
                            title: 'Loading question...');
                      }
                      if (state is StartSessionError) {
                        Navigator.of(context, rootNavigator: true).pop();
                        return AppToast.showToast(
                            context: context,
                            title: S.of(context).app_toast_error,
                            description: state.message,
                            type: ToastificationType.error);
                      }
                    },
                    buildWhen: (previous, current) =>
                        current is StartSessionSuccess,
                    builder: (context, state) {
                      if (state is StartSessionSuccess) {
                        Navigator.of(context, rootNavigator: true).pop();
                        final startSessionResponseEntity =
                            state.startSessionResponseEntity;
                        answerRequestEntity.sessionId =
                            startSessionResponseEntity.sessionId;
                        return SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: size.height * 0.015,
                                    decoration: BoxDecoration(
                                      color: AppColors.transparent,
                                      border: Border.all(
                                        color: isLightMode
                                            ? AppColors.secondary.withAlpha(120)
                                            : AppColors.primary.withAlpha(100),
                                      ),
                                      borderRadius: BorderRadius.circular(16.r),
                                    ),
                                  ),
                                  AnimatedContainer(
                                    width: progress,
                                    height: size.height * 0.015,
                                    duration: const Duration(milliseconds: 100),
                                    curve: Curves.easeInOut,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16.r),
                                      gradient: LinearGradient(
                                        colors: [
                                          AppColors.blue,
                                          AppColors.purple,
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: size.height * 0.01),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  '${S.of(context).questions_page_title1}${startSessionResponseEntity.questionNumber} / 10',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: isLightMode
                                        ? AppColors.secondary
                                        : AppColors.primary.withAlpha(220),
                                  ),
                                ),
                              ),
                              SizedBox(height: size.height * 0.04),
                              isLightMode
                                  ? Text(
                                      '${S.of(context).questions_page_title1}${startSessionResponseEntity.questionNumber}',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                        color: isLightMode
                                            ? AppColors.purple
                                            : AppColors.blue,
                                      ),
                                    )
                                  : Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8.w, vertical: 6.h),
                                      decoration: BoxDecoration(
                                        color: AppColors.primary.withAlpha(240),
                                        borderRadius:
                                            BorderRadius.circular(24.r),
                                      ),
                                      child: Text(
                                        '${S.of(context).questions_page_title1}${startSessionResponseEntity.questionNumber}',
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w800,
                                          color: isLightMode
                                              ? AppColors.purple
                                              : AppColors.blue,
                                        ),
                                      ),
                                    ),
                              SizedBox(height: size.height * 0.02),
                              Text(
                                startSessionResponseEntity.question,
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w800,
                                  color: isLightMode
                                      ? AppColors.black
                                      : AppColors.primary.withAlpha(220),
                                ),
                              ),
                              SizedBox(height: size.height * 0.04),
                              AnswersWidget(
                                learnCubit: widget.learnCubit,
                                answerRequestEntity: answerRequestEntity,
                                question: startSessionResponseEntity.question,
                                options: startSessionResponseEntity
                                    .options.values
                                    .toList(),
                                index:
                                    startSessionResponseEntity.questionNumber -
                                        1,
                                pageController: pageController,
                              ),
                              SizedBox(height: size.height * 0.02),
                              SizedBox(height: size.height * 0.02),
                            ],
                          ),
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  )
                : BlocConsumer<LearnCubit, LearnState>(
                    bloc: widget.learnCubit,
                    listenWhen: (previous, current) =>
                        current is AnswerLoading ||
                        current is AnswerError ||
                        current is FinalAnswerLoading ||
                        current is FinalAnswerSuccess ||
                        current is FinalAnswerError,
                    listener: (context, state) {
                      if (state is AnswerLoading) {
                        return AppDialogs.showLoadingDialog(context,
                            title: 'Loading question...');
                      }
                      if (state is AnswerError) {
                        Navigator.of(context, rootNavigator: true).pop();
                        return AppToast.showToast(
                            context: context,
                            title: S.of(context).app_toast_error,
                            description: state.message,
                            type: ToastificationType.error);
                      }
                      if (state is FinalAnswerLoading) {
                        return AppDialogs.showLoadingDialog(context,
                            title: 'Generating suggested track...');
                      }
                      if (state is FinalAnswerSuccess) {
                        Navigator.of(context, rootNavigator: true).pop();
                        Navigator.of(context).pushReplacementNamed(
                          AppRoutes.suggestedTrack,
                          arguments: {
                            'learnCubit': widget.learnCubit,
                            'suggestedTrack': state.finalAnswerResponseEntity.recommendation,
                          },
                        );
                      }
                      if (state is FinalAnswerError) {
                        Navigator.of(context, rootNavigator: true).pop();
                        return AppToast.showToast(
                            context: context,
                            title: S.of(context).app_toast_error,
                            description: state.message,
                            type: ToastificationType.error);
                      }
                    },
                    buildWhen: (previous, current) =>
                        current is AnswerSuccess ||
                        current is FinalAnswerSuccess,
                    builder: (context, state) {
                      if (state is AnswerSuccess) {
                        Navigator.of(context, rootNavigator: true).pop();
                        final answerResponseEntity = state.answerResponseEntity;
                        return SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: size.height * 0.015,
                                    decoration: BoxDecoration(
                                      color: AppColors.transparent,
                                      border: Border.all(
                                        color: isLightMode
                                            ? AppColors.secondary.withAlpha(120)
                                            : AppColors.primary.withAlpha(100),
                                      ),
                                      borderRadius: BorderRadius.circular(16.r),
                                    ),
                                  ),
                                  AnimatedContainer(
                                    width: progress,
                                    height: size.height * 0.015,
                                    duration: const Duration(milliseconds: 100),
                                    curve: Curves.easeInOut,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16.r),
                                      gradient: LinearGradient(
                                        colors: [
                                          AppColors.blue,
                                          AppColors.purple,
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: size.height * 0.01),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  '${S.of(context).questions_page_title1}${answerResponseEntity.questionNumber} / 10',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: isLightMode
                                        ? AppColors.secondary
                                        : AppColors.primary.withAlpha(220),
                                  ),
                                ),
                              ),
                              SizedBox(height: size.height * 0.04),
                              isLightMode
                                  ? Text(
                                      '${S.of(context).questions_page_title1}${answerResponseEntity.questionNumber}',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                        color: isLightMode
                                            ? AppColors.purple
                                            : AppColors.blue,
                                      ),
                                    )
                                  : Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8.w, vertical: 6.h),
                                      decoration: BoxDecoration(
                                        color: AppColors.primary.withAlpha(240),
                                        borderRadius:
                                            BorderRadius.circular(24.r),
                                      ),
                                      child: Text(
                                        '${S.of(context).questions_page_title1}${answerResponseEntity.questionNumber}',
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w800,
                                          color: isLightMode
                                              ? AppColors.purple
                                              : AppColors.blue,
                                        ),
                                      ),
                                    ),
                              SizedBox(height: size.height * 0.02),
                              Text(
                                answerResponseEntity.question,
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w800,
                                  color: isLightMode
                                      ? AppColors.black
                                      : AppColors.primary.withAlpha(220),
                                ),
                              ),
                              SizedBox(height: size.height * 0.04),
                              AnswersWidget(
                                learnCubit: widget.learnCubit,
                                answerRequestEntity: answerRequestEntity,
                                question: answerResponseEntity.question,
                                options: answerResponseEntity.options.values
                                    .toList(),
                                index: answerResponseEntity.questionNumber - 1,
                                pageController: pageController,
                              ),
                              SizedBox(height: size.height * 0.02),
                              SizedBox(height: size.height * 0.02),
                            ],
                          ),
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  );
          },
        ),
      ),
    );
  }
}
