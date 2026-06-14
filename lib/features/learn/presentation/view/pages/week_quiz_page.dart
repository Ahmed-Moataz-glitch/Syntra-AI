import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syntra_ai/core/utils/app_colors.dart';
import 'package:syntra_ai/core/utils/app_dialogs.dart';
import 'package:syntra_ai/core/utils/app_toast.dart';
import 'package:syntra_ai/core/view/widgets/secondary_gradient_button_widget.dart';
import 'package:syntra_ai/features/learn/data/api/learn_api.dart';
import 'package:syntra_ai/features/learn/data/repo/data_source/learn_data_source_impl.dart';
import 'package:syntra_ai/features/learn/data/repo/repo/learn_repo_impl.dart';
import 'package:syntra_ai/features/learn/domain/entities/extract_key_points_request_entity.dart';
import 'package:syntra_ai/features/learn/domain/entities/extract_key_points_response_entity.dart';
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
import 'package:syntra_ai/features/learn/presentation/view/pages/week_quiz_questions_page.dart';
import 'package:syntra_ai/features/learn/presentation/view_model/learn_cubit.dart';
import 'package:toastification/toastification.dart';

class WeekQuizPage extends StatefulWidget {
  final GenerateRoadmapResponseEntity generateRoadmapResponseEntity;
  const WeekQuizPage({super.key, required this.generateRoadmapResponseEntity});

  @override
  State<WeekQuizPage> createState() => _WeekQuizPageState();
}

class _WeekQuizPageState extends State<WeekQuizPage> {
  late final LearnCubit learnCubit;
  late final GlobalKey<FormState> formKey;
  late final List<TextEditingController> keyPointControllers;

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    keyPointControllers = [];
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
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await learnCubit.extractKeyPoints(
        ExtractKeyPointsRequestEntity(
          trackName: widget.generateRoadmapResponseEntity.trackName,
          urls: getUrlsForCurrentWeek(),
        ),
      );
    });
  }

  @override
  void dispose() {
    formKey.currentState?.dispose();
    for (var controller in keyPointControllers) {
      controller.dispose();
    }
    learnCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'WEEK ${widget.generateRoadmapResponseEntity.roadmap[widget.generateRoadmapResponseEntity.selectedIndex].weekNumber} QUIZ',
          style: TextStyle(
            color: AppColors.purple,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: BlocConsumer<LearnCubit, LearnState>(
        bloc: learnCubit,
        listenWhen: (previous, current) =>
            current is ExtractKeyPointsLoading ||
            current is ExtractKeyPointsSuccess ||
            current is ExtractKeyPointsError,
        buildWhen: (previous, current) => current is ExtractKeyPointsSuccess,
        listener: (context, state) {
          if (state is ExtractKeyPointsLoading) {
            AppDialogs.showLoadingDialog(context,
                title: 'Extracting key points...');
          }
          if (state is ExtractKeyPointsSuccess) {
            Navigator.of(context, rootNavigator: true).pop();
            keyPointControllers
                .addAll(state.extractKeyPointsResponseEntity.keyPoints.map(
              (keyPoint) => TextEditingController(text: keyPoint),
            ));
          }
          if (state is ExtractKeyPointsError) {
            Navigator.of(context, rootNavigator: true).pop();
            AppToast.showToast(
                context: context,
                title: 'Error',
                description: state.message,
                type: ToastificationType.error);
          }
        },
        builder: (context, state) {
          if (state is ExtractKeyPointsSuccess) {
            final keyPoints = state.extractKeyPointsResponseEntity.keyPoints;
            return SingleChildScrollView(
              padding: EdgeInsets.only(
                left: 16.w,
                right: 16.w,
                top: 24.h,
                bottom: MediaQuery.of(context).viewInsets.bottom + 16.h,
              ),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Review key points',
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Edit, add, or remove points before generating your week quiz.',
                      style: TextStyle(
                        color: AppColors.secondary,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          spacing: 12.w,
                          children: [
                            Container(
                              width: 8.w,
                              height: 8.w,
                              decoration: BoxDecoration(
                                color: AppColors.purple,
                                shape: BoxShape.circle,
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                onTapOutside: (_) => FocusScope.of(context).unfocus(),
                                controller: keyPointControllers[index],
                                style: TextStyle(
                                  color: AppColors.black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 4.h, horizontal: 8.w),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.r),
                                    borderSide: BorderSide(
                                      color: AppColors.gray.withAlpha(150),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.r),
                                    borderSide: BorderSide(
                                      color: AppColors.purple.withAlpha(200),
                                      width: 1.5.r,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.delete,
                                size: 28.sp,
                                color: AppColors.secondary.withAlpha(150),
                              ),
                              onPressed: () {
                                setState(() {
                                  keyPoints.removeAt(index);
                                  keyPointControllers.removeAt(index);
                                });
                              },
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (_, __) => SizedBox(height: 12.h),
                      itemCount: keyPoints.length,
                    ),
                    SizedBox(height: 16.h),
                    SizedBox(
                      width: size.width * 0.33,
                      child: InkWell(
                        splashFactory: NoSplash.splashFactory,
                        onTap: () {
                          setState(() {
                            keyPoints.add('');
                            keyPointControllers.add(TextEditingController());
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 3.w, right: 8.w, top: 6.h, bottom: 6.h),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.purple,
                              width: 1.5.r,
                            ),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                size: 24.sp,
                                color: AppColors.purple,
                              ),
                              SizedBox(width: 4.w),
                              Text(
                                'Add point',
                                style: TextStyle(
                                  color: AppColors.purple,
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 48.h),
                    Row(
                      children: [
                        Expanded(
                          child: SecondaryGradientButtonWidget(
                            title: 'Generate quiz', 
                            onPressed: (){
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => WeekQuizQuestionsPage(
                                    learnCubit: learnCubit,
                                    generateRoadmapResponseEntity: widget.generateRoadmapResponseEntity,
                                    extractKeyPointsResponseEntity: ExtractKeyPointsResponseEntity(
                                      trackName: widget.generateRoadmapResponseEntity.trackName,
                                      keyPoints: keyPointControllers.map((controller) => controller.text).toList(),
                                    ),
                                    weekNumber: widget.generateRoadmapResponseEntity.roadmap[widget.generateRoadmapResponseEntity.selectedIndex].weekNumber,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 36.h),
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

  List<String> getUrlsForCurrentWeek() {
    final skills = widget.generateRoadmapResponseEntity
        .roadmap[widget.generateRoadmapResponseEntity.selectedIndex].skills;
    List<String> urls = [];
    for (var skill in skills) {
      urls.add(skill.resources.youtubeLink);
      urls.add(skill.resources.articleLink);
    }
    return urls;
  }
}
