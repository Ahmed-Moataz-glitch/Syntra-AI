import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syntra_ai/core/utils/app_colors.dart';
import 'package:syntra_ai/core/utils/app_localization.dart';
import 'package:syntra_ai/features/learn/data/api/learn_api.dart';
import 'package:syntra_ai/features/learn/data/model/project_model.dart';
import 'package:syntra_ai/features/learn/data/repo/data_source/learn_data_source_impl.dart';
import 'package:syntra_ai/features/learn/data/repo/repo/learn_repo_impl.dart';
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
import 'package:syntra_ai/features/learn/presentation/view_model/learn_cubit.dart';
import 'package:syntra_ai/generated/l10n.dart';

class ProjectPageViewWidget extends StatefulWidget {
  const ProjectPageViewWidget({super.key});

  @override
  State<ProjectPageViewWidget> createState() => _ProjectPageViewWidgetState();
}

class _ProjectPageViewWidgetState extends State<ProjectPageViewWidget> {
  late final LearnCubit learnCubit;
  late final GlobalKey<FormState> _formKey;
  String? descriptionError;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
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
    learnCubit.close();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    final isArabic = AppLocalization.isArabic();
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16.h,
        children: [
          Row(
            spacing: 16.w,
            children: [
              Container(
                width: 48.w,
                height: 48.h,
                decoration: BoxDecoration(
                  color: isLightMode
                      ? AppColors.purple.withAlpha(30)
                      : AppColors.blue.withAlpha(80),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(
                  Icons.business_center_outlined,
                  size: 32.sp,
                  color: isLightMode ? AppColors.purple : AppColors.blue,
                ),
              ),
              Text(
                S.of(context).project_page_view_title1,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: isLightMode
                      ? AppColors.black
                      : AppColors.primary.withAlpha(240),
                ),
              ),
            ],
          ),
          Text(
            S.of(context).project_page_view_title2,
            style: TextStyle(
              fontSize: isArabic ? 15.sp : 14.sp,
              fontWeight: isArabic ? FontWeight.w700 : null,
              color: isLightMode
                  ? AppColors.black.withAlpha(160)
                  : AppColors.primary.withAlpha(220),
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            S.of(context).project_page_view_title3,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: isLightMode
                  ? AppColors.secondary
                  : AppColors.primary.withAlpha(220),
            ),
          ),
          TextFormField(
            textDirection: TextDirection.ltr,
            controller: project.projectDescriptionController,
            // onChanged: (value) => project.copyWith(projectDescription: value),
            onChanged: (value) {
              setState(() {
                if (value.isEmpty) {
                  descriptionError =
                      S.of(context).project_page_view_validator_error1;
                } else if (value.length < 20) {
                  descriptionError =
                      S.of(context).project_page_view_validator_error2;
                } else {
                  descriptionError =
                      null; // Clear the error if it passes validation
                  // Only update the project model if it meets the 20-character rule
                  project.projectDescriptionController.text = value;
                }
              });
            },
            maxLines: 6,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return S.of(context).project_page_view_validator_error1;
              }
              if (value.length < 20) {
                return S.of(context).project_page_view_validator_error2;
              }
              return null;
            },
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: isLightMode
                  ? AppColors.purple
                  : AppColors.blue.withAlpha(220),
            ),
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
            decoration: InputDecoration(
              hintTextDirection: TextDirection.ltr,
              hintText:
                  'e.g. We are building a modern e-commerce web application. We need a sleek UI, a robust Node.js backend with user authentication, and a recommendation engine using Python.',
              hintStyle: TextStyle(
                fontSize: 16.sp,
                color: isLightMode
                    ? AppColors.black.withAlpha(160)
                    : AppColors.blue.withAlpha(220),
              ),
              filled: true,
              fillColor: isLightMode
                  ? AppColors.purple.withAlpha(15)
                  : AppColors.primary.withAlpha(230),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(
                  color: isLightMode
                      ? AppColors.secondary.withAlpha(170)
                      : AppColors.transparent,
                  strokeAlign: BorderSide.strokeAlignOutside,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(
                  color: isLightMode ? AppColors.purple : AppColors.blue,
                  width: 2.w,
                  strokeAlign: BorderSide.strokeAlignOutside,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
