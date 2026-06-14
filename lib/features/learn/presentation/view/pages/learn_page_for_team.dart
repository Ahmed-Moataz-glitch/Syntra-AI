import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syntra_ai/core/utils/app_colors.dart';
import 'package:syntra_ai/core/utils/app_dialogs.dart';
import 'package:syntra_ai/core/utils/app_localization.dart';
import 'package:syntra_ai/core/utils/app_toast.dart';
import 'package:syntra_ai/core/view/widgets/logo_widget.dart';
import 'package:syntra_ai/core/view/widgets/secondary_gradient_button_widget.dart';
import 'package:syntra_ai/features/learn/data/api/learn_api.dart';
import 'package:syntra_ai/features/learn/data/model/member_model.dart';
import 'package:syntra_ai/features/learn/data/model/project_model.dart';
import 'package:syntra_ai/features/learn/data/repo/data_source/learn_data_source_impl.dart';
import 'package:syntra_ai/features/learn/data/repo/repo/learn_repo_impl.dart';
import 'package:syntra_ai/features/learn/domain/entities/generate_and_assign_request_entity.dart';
import 'package:syntra_ai/features/learn/domain/entities/generate_and_assign_response_entity.dart';
import 'package:syntra_ai/features/learn/domain/entities/set_team_request_entity.dart';
import 'package:syntra_ai/features/learn/domain/repo/data_source/learn_data_source.dart';
import 'package:syntra_ai/features/learn/domain/repo/repo/learn_repo.dart';
import 'package:syntra_ai/features/learn/domain/use_case/add_finished_skill_use_case.dart';
import 'package:syntra_ai/features/learn/domain/use_case/add_finished_track_use_case.dart';
import 'package:syntra_ai/features/learn/domain/use_case/answer_use_case.dart';
import 'package:syntra_ai/features/learn/domain/use_case/evaluate_project_use_case.dart';
import 'package:syntra_ai/features/learn/domain/use_case/evaluation_result_use_case.dart';
import 'package:syntra_ai/features/learn/domain/use_case/extract_key_points_use_case.dart';
import 'package:syntra_ai/features/learn/domain/use_case/generate_and_assign_use_case.dart';
import 'package:syntra_ai/features/learn/domain/use_case/generate_quiz_use_case.dart';
import 'package:syntra_ai/features/learn/domain/use_case/generate_roadmap_use_case.dart';
import 'package:syntra_ai/features/learn/domain/use_case/recommended_projects_use_case.dart';
import 'package:syntra_ai/features/learn/domain/use_case/set_team_use_case.dart';
import 'package:syntra_ai/features/learn/domain/use_case/start_session_use_case.dart';
import 'package:syntra_ai/features/learn/presentation/view/widgets/project_page_view_widget.dart';
import 'package:syntra_ai/features/learn/presentation/view/widgets/tasks_page_view_widget.dart';
import 'package:syntra_ai/features/learn/presentation/view/widgets/team_page_view_widget.dart';
import 'package:syntra_ai/features/learn/presentation/view_model/learn_cubit.dart';
import 'package:syntra_ai/generated/l10n.dart';
import 'package:toastification/toastification.dart';

class LearnPageForTeam extends StatefulWidget {
  const LearnPageForTeam({super.key});

  @override
  State<LearnPageForTeam> createState() => _LearnPageForTeamState();
}

class _LearnPageForTeamState extends State<LearnPageForTeam> {
  late final PageController pageController;
  late final LearnCubit learnCubit;
  late GenerateAndAssignResponseEntity generateAndAssignResponseEntity;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    LearnApi learnApi = LearnApi();
    LearnDataSource learnDataSource = LearnDataSourceImpl(learnApi);
    LearnRepo learnRepo = LearnRepoImpl(learnDataSource);
    StartSessionUseCase startSessionUseCase = StartSessionUseCase(learnRepo);
    AnswerUseCase answerUseCase = AnswerUseCase(learnRepo);
    GenerateRoadmapUseCase generateRoadmapUseCase = GenerateRoadmapUseCase(learnRepo);
    ExtractKeyPointsUseCase extractKeyPointsUseCase = ExtractKeyPointsUseCase(learnRepo);
    GenerateQuizUseCase generateQuizUseCase = GenerateQuizUseCase(learnRepo);
    RecommendedProjectsUseCase recommendedProjectsUseCase = RecommendedProjectsUseCase(learnRepo);
    EvaluateProjectUseCase evaluateProjectUseCase = EvaluateProjectUseCase(learnRepo);
    EvaluationResultUseCase evaluationResultUseCase = EvaluationResultUseCase(learnRepo);
    SetTeamUseCase setTeamUseCase = SetTeamUseCase(learnRepo);
    GenerateAndAssignUseCase generateAndAssignUseCase =
        GenerateAndAssignUseCase(learnRepo);
    AddFinishedSkillUseCase addFinishedSkillUseCase =
        AddFinishedSkillUseCase(learnRepo);
    AddFinishedTrackUseCase addFinishedTrackUseCase =
        AddFinishedTrackUseCase(learnRepo);
    learnCubit = LearnCubit(
      startSessionUseCase: startSessionUseCase,
      answerUseCase: answerUseCase,
      generateRoadmapUseCase: generateRoadmapUseCase,
      extractKeyPointsUseCase: extractKeyPointsUseCase,
      generateQuizUseCase: generateQuizUseCase,
      recommendedProjectsUseCase: recommendedProjectsUseCase,
      evaluateProjectUseCase: evaluateProjectUseCase,
      evaluationResultUseCase: evaluationResultUseCase,
      setTeamUseCase: setTeamUseCase,
      generateAndAssignUseCase: generateAndAssignUseCase,
      addFinishedSkillUseCase: addFinishedSkillUseCase,
      addFinishedTrackUseCase: addFinishedTrackUseCase,
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    learnCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    final isArabic = AppLocalization.isArabic();
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
      body: BlocListener<LearnCubit, LearnState>(
        bloc: learnCubit,
        listenWhen: (previous, current) =>
            current is SetTeamLoading ||
            current is SetTeamSuccess ||
            current is GenerateAndAssignLoading ||
            current is GenerateAndAssignSuccess ||
            current is SetTeamError ||
            current is GenerateAndAssignError,
        listener: (context, state) {
          if (state is SetTeamLoading) {
            AppDialogs.showLoadingDialog(context, title: S.of(context).loading_set_team);
          }
          if (state is SetTeamSuccess) {
            Navigator.of(context, rootNavigator: true).pop();
            pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          }
          if(state is GenerateAndAssignSuccess){
            Navigator.of(context, rootNavigator: true).pop();
            generateAndAssignResponseEntity = state.generateAndAssignResponseEntity;
            pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          }
          if (state is GenerateAndAssignLoading) {
            AppDialogs.showLoadingDialog(context, title: S.of(context).loading_generate_and_assign);
          }
          if (state is SetTeamError) {
            Navigator.of(context, rootNavigator: true).pop();
            AppToast.showToast(
                context: context,
                title: S.of(context).app_toast_error,
                description: state.message,
                type: ToastificationType.error);
          }
          if (state is GenerateAndAssignError) {
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
          child: PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            itemCount: 3,
            itemBuilder: (context, index) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.04),
                    Stack(
                      children: [
                        Container(
                          height: size.height * 0.015,
                          decoration: BoxDecoration(
                            color: AppColors.transparent,
                            border: Border.all(
                              color: isLightMode
                                  ? AppColors.secondary.withAlpha(120)
                                  : AppColors.primary.withAlpha(60),
                            ),
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                        ),
                        AnimatedContainer(
                          width: switch (index) {
                            0 => size.width * 0.25,
                            1 => size.width * 0.75,
                            2 => size.width,
                            _ => size.width * 0.25,
                          },
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          S.of(context).learn_page_for_team_title1,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: isLightMode
                                ? index == 0
                                    ? AppColors.purple
                                    : AppColors.black.withAlpha(80)
                                : index == 0
                                    ? AppColors.blue
                                    : AppColors.primary.withAlpha(60),
                          ),
                        ),
                        Text(
                          S.of(context).learn_page_for_team_title2,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: isLightMode
                                ? index == 1
                                    ? AppColors.purple
                                    : AppColors.black.withAlpha(80)
                                : index == 1
                                    ? AppColors.blue
                                    : AppColors.primary.withAlpha(60),
                          ),
                        ),
                        Text(
                          S.of(context).learn_page_for_team_title3,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: isLightMode
                                ? index == 2
                                    ? AppColors.purple
                                    : AppColors.black.withAlpha(80)
                                : index == 2
                                    ? AppColors.blue
                                    : AppColors.primary.withAlpha(60),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.04),
                    switch (index) {
                      0 => TeamPageViewWidget(),
                      1 => ProjectPageViewWidget(),
                      2 => TasksPageViewWidget(generateAndAssignResponseEntity: generateAndAssignResponseEntity),
                      _ => TeamPageViewWidget(),
                    },
                    SizedBox(height: size.height * 0.04),
                    Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        width: switch (index) {
                          0 => size.width * 0.4,
                          1 => isArabic ? size.width * 0.4 : size.width * 0.55,
                          2 => size.width * 0.45,
                          _ => size.width * 0.3,
                        },
                        child: SecondaryGradientButtonWidget(
                          title: switch (index) {
                            0 => S.of(context).learn_page_for_team_button1,
                            1 => S.of(context).learn_page_for_team_button2,
                            2 => S.of(context).learn_page_for_team_button3,
                            _ => S.of(context).learn_page_for_team_button1,
                          },
                          icon: switch (index) {
                            0 => Icons.arrow_forward,
                            1 => Icons.auto_fix_high,
                            2 => null,
                            _ => Icons.arrow_forward,
                          },
                          onPressed: () async {
                            switch (index) {
                              case 0:
                                await learnCubit.setTeam(members
                                    .map<SetTeamRequestEntity>(
                                      (MemberModel member) =>
                                          SetTeamRequestEntity(
                                        id: member.id,
                                        name: member.memberNameController.text
                                            .trim(),
                                        skills: member.memberSkills,
                                        currentWorkload: 0,
                                      ),
                                    )
                                    .toList());
                                break;
                              case 1:
                                await learnCubit.generateAndAssign(
                                  GenerateAndAssignRequestEntity(
                                    projectDescription:
                                        project.projectDescriptionController.text.trim(),
                                    // projectDescription: 'We are building Syntra.Ai that is 3 * 1 learning, tasks assignment for team members, send invitation to talent',
                                  ),
                                );
                                break;
                              case 2:
                                pageController.animateToPage(
                                  0,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                                break;
                            }
                            // if (index == 2) {
                            //   pageController.animateToPage(
                            //     1,
                            //     duration: const Duration(milliseconds: 300),
                            //     curve: Curves.easeInOut,
                            //   );
                            //   return;
                            // } else {}
                            // switch(index){
                            //   case 0:

                            //     break;
                            //   case 1:

                            //   case 2:
                            //     AppToast.showToast(context: context, title: 'Success', description: 'Your team and tasks have been set successfully!', type: ToastificationType.success);
                            //     break;
                            // }
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
