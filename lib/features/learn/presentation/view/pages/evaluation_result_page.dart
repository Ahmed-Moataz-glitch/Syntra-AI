import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syntra_ai/core/utils/app_colors.dart';
import 'package:syntra_ai/core/utils/app_dialogs.dart';
import 'package:syntra_ai/core/utils/app_toast.dart';
import 'package:syntra_ai/features/learn/domain/entities/evaluate_project_request_entity.dart';
import 'package:syntra_ai/features/learn/presentation/view/widgets/requirements_widget.dart';
import 'package:syntra_ai/features/learn/presentation/view/widgets/strengths_widget.dart';
import 'package:syntra_ai/features/learn/presentation/view/widgets/weaknesses_widget.dart';
import 'package:syntra_ai/features/learn/presentation/view_model/learn_cubit.dart';
import 'package:toastification/toastification.dart';

class EvaluationResultPage extends StatefulWidget {
  final LearnCubit learnCubit;
  final EvaluateProjectRequestEntity evaluateProjectRequestEntity;
  const EvaluationResultPage(
      {super.key,
      required this.learnCubit,
      required this.evaluateProjectRequestEntity});

  @override
  State<EvaluationResultPage> createState() => _EvaluationResultPageState();
}

class _EvaluationResultPageState extends State<EvaluationResultPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await widget.learnCubit
          .evaluateProject(widget.evaluateProjectRequestEntity);
      Future.delayed(const Duration(seconds: 35), () async {
        await widget.learnCubit
            .getEvaluationResult(widget.evaluateProjectRequestEntity.studentId);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Evaluation Result'),
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<LearnCubit, LearnState>(
            bloc: widget.learnCubit,
            listenWhen: (previous, current) =>
                current is EvaluateProjectLoading ||
                current is EvaluateProjectSuccess ||
                current is EvaluateProjectError,
            listener: (context, state) {
              if (state is EvaluateProjectLoading) {
                AppDialogs.showLoadingDialog(context,
                    title: 'Evaluating your project...');
              }
              if (state is EvaluateProjectSuccess) {
                Navigator.of(context, rootNavigator: true).pop();
              }
              if (state is EvaluateProjectError) {
                Navigator.of(context, rootNavigator: true).pop();
                AppToast.showToast(
                    context: context,
                    title: 'Error',
                    description: state.message,
                    type: ToastificationType.error);
              }
            },
          ),
          BlocListener<LearnCubit, LearnState>(
            bloc: widget.learnCubit,
            listenWhen: (previous, current) =>
                current is EvaluationResultLoading ||
                current is EvaluationResultSuccess ||
                current is EvaluationResultError,
            listener: (context, state) {
              if (state is EvaluationResultLoading) {
                AppDialogs.showLoadingDialog(context,
                    title: 'Getting evaluation result...');
              }
              if (state is EvaluationResultSuccess) {
                Navigator.of(context, rootNavigator: true).pop();
              }
              if (state is EvaluationResultError) {
                Navigator.of(context, rootNavigator: true).pop();
                AppToast.showToast(
                    context: context,
                    title: 'Error',
                    description: state.message,
                    type: ToastificationType.error);
              }
            },
          ),
        ],
        child: BlocBuilder<LearnCubit, LearnState>(
          bloc: widget.learnCubit,
          buildWhen: (previous, current) => current is EvaluationResultSuccess,
          builder: (context, state) {
            if (state is EvaluationResultSuccess) {
              final evaluationResultResponseEntity =
                  state.evaluationResultResponseEntity;
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(16.r),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(20),
                          blurRadius: 8.r,
                          spreadRadius: 3.r,
                          offset: Offset(1, 1),
                        ),
                      ],
                      border: Border.all(
                        color: AppColors.secondary.withAlpha(150),
                        width: 1.4.w,
                      ),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8.r),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                AppColors.red.withAlpha(30),
                                AppColors.orange.withAlpha(30),
                              ],
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12.r),
                              topRight: Radius.circular(12.r),
                            ),
                          ),
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    evaluationResultResponseEntity.status ==
                                            "Failed"
                                        ? Icons.cancel
                                        : Icons.check_circle,
                                    color:
                                        evaluationResultResponseEntity.status ==
                                                "Failed"
                                            ? Colors.red
                                            : Colors.green,
                                    size: 28.sp,
                                  ),
                                  SizedBox(width: 12.w),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    spacing: 4.h,
                                    children: [
                                      Text(
                                        'EVALUATION RESULTS',
                                        style: TextStyle(
                                          color: AppColors.secondary
                                              .withAlpha(150),
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        evaluationResultResponseEntity.status,
                                        style: TextStyle(
                                          color: evaluationResultResponseEntity
                                                      .status ==
                                                  "passed"
                                              ? Colors.green
                                              : Colors.red,
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Column(
                                children: [
                                  Text(
                                    evaluationResultResponseEntity.score
                                        .toString(),
                                    style: TextStyle(
                                      color: evaluationResultResponseEntity.score >= 50
                                          ? Colors.green
                                          : Colors.red,
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'SCORE',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: AppColors.secondary.withAlpha(150),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'REQUIREMENTS MET',
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8.h),
                              RequirementsWidget(
                                requirementsMet: evaluationResultResponseEntity
                                    .requirementsMet,
                              ),
                              Text(
                                'STRENGTHS',
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      const Color.fromARGB(255, 127, 240, 185),
                                ),
                              ),
                              SizedBox(height: 8.h),
                              StrengthsWidget(
                                strengths: evaluationResultResponseEntity
                                    .feedback.strengths,
                              ),
                              SizedBox(height: 12.h),
                              Text(
                                'WEAKNESSES',
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      const Color.fromARGB(255, 240, 127, 127),
                                ),
                              ),
                              SizedBox(height: 8.h),
                              WeaknessesWidget(
                                weaknesses: evaluationResultResponseEntity
                                    .feedback.weaknesses,
                              ),
                              SizedBox(height: 12.h),
                              Container(
                                padding: EdgeInsets.all(12.r),
                                decoration: BoxDecoration(
                                  color: AppColors.purple.withAlpha(20),
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                child: Column(
                                  spacing: 12.h,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'SUGGESTIONS',
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.purple,
                                      ),
                                    ),
                                    Text(
                                      evaluationResultResponseEntity
                                          .feedback.suggestions,
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        color: AppColors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 16.h),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
