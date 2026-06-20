import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:syntra_ai/core/utils/app_assets.dart';
import 'package:syntra_ai/core/utils/app_colors.dart';
import 'package:syntra_ai/core/utils/app_routes.dart';
import 'package:syntra_ai/core/view/widgets/logo_widget.dart';
import 'package:syntra_ai/features/learn/data/api/learn_api.dart';
import 'package:syntra_ai/features/learn/data/model/user_roadmap_model.dart';
import 'package:syntra_ai/features/learn/data/repo/data_source/learn_data_source_impl.dart';
import 'package:syntra_ai/features/learn/data/repo/repo/learn_repo_impl.dart';
import 'package:syntra_ai/features/learn/domain/entities/generate_roadmap_response_entity.dart';
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
import 'package:syntra_ai/features/learn/presentation/view/widgets/gradient_text_widget.dart';
import 'package:syntra_ai/features/learn/presentation/view/widgets/row_widget.dart';
import 'package:syntra_ai/core/view/widgets/secondary_gradient_button_widget.dart';
import 'package:syntra_ai/features/learn/presentation/view_model/learn_cubit.dart';
import 'package:syntra_ai/generated/l10n.dart';

class LearnPageForLearner extends StatefulWidget {
  const LearnPageForLearner({super.key});

  @override
  State<LearnPageForLearner> createState() => _LearnPageForLearnerState();
}

class _LearnPageForLearnerState extends State<LearnPageForLearner> {
  late final LearnCubit learnCubit;
  late final UserRoadmapModel? savedRoadmapModel;

  @override
  void initState() {
    super.initState();
    LearnApi learnApi = LearnApi();
    LearnDataSource learnDataSource = LearnDataSourceImpl(learnApi);
    LearnRepo learnRepo = LearnRepoImpl(learnDataSource);
    StartSessionUseCase startSessionUseCase = StartSessionUseCase(learnRepo);
    AnswerUseCase answerUseCase = AnswerUseCase(learnRepo);
    GenerateRoadmapUseCase generateRoadmapUseCase =
        GenerateRoadmapUseCase(learnRepo);
    ExtractKeyPointsUseCase extractKeyPointsUseCase =
        ExtractKeyPointsUseCase(learnRepo);
    GenerateQuizUseCase generateQuizUseCase = GenerateQuizUseCase(learnRepo);
    RecommendedProjectsUseCase recommendedProjectsUseCase =
        RecommendedProjectsUseCase(learnRepo);
    EvaluateProjectUseCase evaluateProjectUseCase =
        EvaluateProjectUseCase(learnRepo);
    EvaluationResultUseCase evaluationResultUseCase =
        EvaluationResultUseCase(learnRepo);
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
    savedRoadmapModel = learnCubit.getUserRoadmap();
  }

  @override
  void dispose() {
    learnCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLightMode = Theme.of(context).brightness == Brightness.light;
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: size.width),
              Lottie.asset(
                AppAssets.welcomeRobotLottie,
                width: size.width * 0.7,
                fit: BoxFit.contain,
              ),
              SizedBox(height: size.height * 0.04),
              Text(
                S.of(context).learn_page_title1,
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                  color: isLightMode
                      ? AppColors.black
                      : AppColors.primary.withAlpha(240),
                ),
              ),
              isLightMode
                  ? GradientTextWidget(
                      text: S.of(context).learn_page_title2,
                      gradient: LinearGradient(
                        colors: [
                          AppColors.blue,
                          AppColors.purple,
                        ],
                      ),
                    )
                  : Column(
                      children: [
                        SizedBox(height: size.height * 0.01),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 2.h),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withAlpha(240),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: GradientTextWidget(
                            text: S.of(context).learn_page_title2,
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
              SizedBox(height: size.height * 0.02),
              Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  text: S.of(context).learn_page_title3_part1,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: isLightMode
                        ? AppColors.black
                        : AppColors.primary.withAlpha(180),
                    fontWeight: FontWeight.w400,
                  ),
                  children: [
                    TextSpan(
                      text: S.of(context).learn_page_title3_part2,
                      style: TextStyle(
                        fontSize: 17.sp,
                        color: isLightMode
                            ? AppColors.black
                            : AppColors.primary.withAlpha(220),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: S.of(context).learn_page_title3_part3,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: isLightMode
                            ? AppColors.black
                            : AppColors.primary.withAlpha(180),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.02),
              SizedBox(
                width: size.width * 0.45,
                child: SecondaryGradientButtonWidget(
                  title: S.of(context).learn_page_button1,
                  icon: Icons.arrow_forward,
                  onPressed: () async {
                    Navigator.of(context, rootNavigator: true).pushNamed(
                      AppRoutes.questions,
                      arguments: learnCubit,
                    );
                  },
                ),
              ),
              SizedBox(height: size.height * 0.02),
              savedRoadmapModel != null
                  ? Column(
                      children: [
                        SizedBox(
                          width: size.width * 0.45,
                          child: SecondaryGradientButtonWidget(
                            title: 'Continue Learning',
                            onPressed: () async {
                              Navigator.of(context, rootNavigator: true)
                                  .pushNamed(
                                AppRoutes.roadmap,
                                arguments: {
                                  'learnCubit': learnCubit,
                                  'generateRoadmapResponseEntity':
                                      GenerateRoadmapResponseEntity(
                                    trackName: '',
                                    selectedIndex: 0,
                                    userHoursPerWeek: 0,
                                    totalWeeksCalculated: 0,
                                    roadmap: [],
                                  ),
                                },
                              );
                            },
                          ),
                        ),
                        SizedBox(height: size.height * 0.02),
                      ],
                    )
                  : const SizedBox.shrink(),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: isLightMode
                          ? AppColors.secondary.withAlpha(100)
                          : AppColors.primary.withAlpha(150),
                      // color: AppColors.dividerColor,
                      // thickness: 1,
                      // height: 32.h,
                      // indent: 8.w,
                      // endIndent: 10.w,
                    ),
                  ),
                  Text(
                    S.of(context).learn_page_title4,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 15.sp,
                          color: isLightMode
                              ? null
                              : AppColors.primary.withAlpha(200),
                        ),
                    // style: TextStyle(
                    //   fontSize: 14.sp,
                    //   fontWeight: FontWeight.w500,
                    //   color: AppColors.semiBlack,
                    // ),
                  ),
                  Expanded(
                    child: Divider(
                      color: isLightMode
                          ? AppColors.secondary.withAlpha(100)
                          : AppColors.primary.withAlpha(150),
                      // color: AppColors.dividerColor,
                      // thickness: 1,
                      // height: 32.h,
                      // indent: 10.w,
                      // endIndent: 8.w,
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.04),
              RowWidget(
                learnCubit: learnCubit,
                text: S.of(context).learn_page_title5,
              ),
              SizedBox(height: size.height * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}
