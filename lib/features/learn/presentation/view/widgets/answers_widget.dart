// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syntra_ai/core/utils/app_colors.dart';
import 'package:syntra_ai/core/utils/app_dialogs.dart';
import 'package:syntra_ai/core/utils/app_toast.dart';
import 'package:syntra_ai/core/view/widgets/secondary_gradient_button_widget.dart';
import 'package:syntra_ai/features/learn/domain/entities/answer_request_entity.dart';
import 'package:syntra_ai/features/learn/presentation/view_model/learn_cubit.dart';
import 'package:syntra_ai/generated/l10n.dart';
import 'package:toastification/toastification.dart';

class AnswersWidget extends StatefulWidget {
  final LearnCubit learnCubit;
  final AnswerRequestEntity answerRequestEntity;
  String question;
  List<String> options;
  int index;
  PageController pageController;
  AnswersWidget({
    super.key,
    required this.learnCubit,
    required this.answerRequestEntity,
    required this.question,
    required this.options,
    required this.index,
    required this.pageController,
  });

  @override
  State<AnswersWidget> createState() => _AnswersWidgetState();
}

class _AnswersWidgetState extends State<AnswersWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    return BlocListener<LearnCubit, LearnState>(
      bloc: widget.learnCubit,
      listenWhen: (previous, current) => current is AnswerLoading || current is AnswerError,
      listener: (context, state) {
        if(state is AnswerLoading){
          AppDialogs.showLoadingDialog(context, title: 'Loading question...');
        }
        if(state is AnswerError) {
          Navigator.of(context, rootNavigator: true).pop();
          AppToast.showToast(context: context, title: S.of(context).app_toast_error, description: state.message, type: ToastificationType.error);
        }
      },
      child: Column(
        children: [
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 4,
            separatorBuilder: (context, index) =>
                SizedBox(height: size.height * 0.02),
            itemBuilder: (context, index) {
              return InkWell(
                splashFactory: NoSplash.splashFactory,
                onTap: () {
                  setState(() {
                    widget.answerRequestEntity.selectedAnswer =
                        widget.options[index];
                  });
                },
                child: Container(
                  width: size.width,
                  padding:
                      EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
                  decoration: BoxDecoration(
                    color: widget.answerRequestEntity.selectedAnswer ==
                            widget.options[index]
                        ? isLightMode
                            ? AppColors.purple.withAlpha(30)
                            : AppColors.blue.withAlpha(30)
                        : AppColors.transparent,
                    border: Border.all(
                      color: widget.answerRequestEntity.selectedAnswer ==
                              widget.options[index]
                          ? isLightMode
                              ? AppColors.purple
                              : AppColors.blue
                          : isLightMode
                              ? AppColors.secondary
                              : AppColors.primary.withAlpha(120),
                      width: widget.answerRequestEntity.selectedAnswer ==
                              widget.options[index]
                          ? 2
                          : 1,
                    ),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Row(
                    spacing: 12.w,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(6.h),
                        decoration: BoxDecoration(
                          color: widget.answerRequestEntity.selectedAnswer ==
                                  widget.options[index]
                              ? isLightMode
                                  ? AppColors.purple.withAlpha(220)
                                  : AppColors.blue.withAlpha(220)
                              : AppColors.transparent,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: widget.answerRequestEntity.selectedAnswer ==
                                    widget.options[index]
                                ? AppColors.transparent
                                : AppColors.secondary,
                          ),
                        ),
                        child: Text(
                          switch (index) {
                            0 => S.of(context).questions_page_answer1,
                            1 => S.of(context).questions_page_answer2,
                            2 => S.of(context).questions_page_answer3,
                            3 => S.of(context).questions_page_answer4,
                            _ => '',
                          },
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: widget.answerRequestEntity.selectedAnswer ==
                                    widget.options[index]
                                ? AppColors.primary
                                : isLightMode
                                    ? AppColors.secondary
                                    : AppColors.primary.withAlpha(220),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          widget.options[index],
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: isLightMode
                                ? AppColors.black
                                : AppColors.primary.withAlpha(220),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              width: size.width * 0.3,
              child: SecondaryGradientButtonWidget(
                title: widget.index < 9
                    ? S.of(context).questions_page_title2_value1
                    : S.of(context).questions_page_title2_value2,
                icon: Icons.arrow_forward,
                selectedAnswer: widget.answerRequestEntity.selectedAnswer,
                onPressed: () async {
                  if (widget.index < 9) {
                    await widget.learnCubit.answer(
                      index: widget.index,
                      answerRequestEntity: widget.answerRequestEntity,
                    );
                    widget.pageController.nextPage(
                      duration: const  Duration(milliseconds: 500),
                      curve: Curves.easeIn,
                    );
                  } else {
                    await widget.learnCubit.finalAnswer(
                      index: widget.index,
                      answerRequestEntity: widget.answerRequestEntity,
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
