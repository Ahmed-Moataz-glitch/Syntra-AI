import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syntra_ai/core/utils/app_colors.dart';
import 'package:syntra_ai/core/utils/app_dialogs.dart';
import 'package:syntra_ai/core/utils/app_toast.dart';
import 'package:syntra_ai/core/view/widgets/secondary_gradient_button_widget.dart';
import 'package:syntra_ai/features/learn/data/api/learn_api.dart';
import 'package:syntra_ai/features/learn/data/model/user_roadmap_model.dart';
import 'package:syntra_ai/features/learn/data/repo/data_source/learn_data_source_impl.dart';
import 'package:syntra_ai/features/learn/data/repo/repo/learn_repo_impl.dart';
import 'package:syntra_ai/features/learn/domain/entities/add_finished_skill_request_entity.dart';
import 'package:syntra_ai/features/learn/domain/entities/add_finished_track_request_entity.dart';
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
import 'package:syntra_ai/features/learn/presentation/view/pages/roadmap_page.dart';
import 'package:syntra_ai/features/learn/presentation/view/pages/week_quiz_page.dart';
import 'package:syntra_ai/features/learn/presentation/view_model/learn_cubit.dart';
import 'package:toastification/toastification.dart';

class WeekQuizResultPage extends StatefulWidget {
  final GenerateRoadmapResponseEntity generateRoadmapResponseEntity;
  final int weekNumber;
  final int score;
  const WeekQuizResultPage(
      {super.key,
      required this.generateRoadmapResponseEntity,
      required this.weekNumber,
      required this.score});
  @override
  State<WeekQuizResultPage> createState() => _WeekQuizResultPageState();
}

class _WeekQuizResultPageState extends State<WeekQuizResultPage> {
  late final LearnCubit learnCubit;

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'WEEK ${widget.weekNumber} QUIZ',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.purple,
          ),
        ),
      ),
      body: widget.score >= 7
          ? MultiBlocListener(
              listeners: [
                BlocListener<LearnCubit, LearnState>(
                  bloc: learnCubit,
                  listenWhen: (previous, current) =>
                      current is AddFinishedTrackLoading ||
                      current is AddFinishedTrackSuccess ||
                      current is AddFinishedTrackError,
                  listener: (context, state) {
                    if (state is AddFinishedTrackLoading) {
                      AppDialogs.showLoadingDialog(context,
                          title: 'Adding Finished Track...');
                    }
                    if (state is AddFinishedTrackSuccess) {
                      Navigator.of(context, rootNavigator: true).pop();
                    }
                    if (state is AddFinishedTrackError) {
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
                  bloc: learnCubit,
                  listenWhen: (previous, current) =>
                      current is AddFinishedSkillLoading ||
                      current is AddFinishedSkillSuccess ||
                      current is AddFinishedSkillError,
                  listener: (context, state) {
                    if (state is AddFinishedSkillLoading) {
                      AppDialogs.showLoadingDialog(context,
                          title: 'Adding Finished Skill...');
                    }
                    if (state is AddFinishedSkillSuccess) {
                      Navigator.of(context, rootNavigator: true).pop();
                    }
                    if (state is AddFinishedSkillError) {
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
                  bloc: learnCubit,
                  listenWhen: (previous, current) =>
                      current is SaveRoadmapSuccess ||
                      current is SaveRoadmapError,
                  listener: (context, state) {
                    if (state is SaveRoadmapSuccess) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => RoadmapPage(
                            learnCubit: learnCubit,
                            generateRoadmapResponseEntity:
                                GenerateRoadmapResponseEntity(
                              trackName: widget
                                  .generateRoadmapResponseEntity.trackName,
                              selectedIndex: widget
                                      .generateRoadmapResponseEntity.selectedIndex +
                                  1,
                              // selectedIndex: widget
                              //         .generateRoadmapResponseEntity
                              //         .selectedIndex +
                              //     11,
                              progress: widget.score >= 7
                                  ? int.parse(
                                      calculateProgress(
                                        calculateCompletedHours(widget
                                            .generateRoadmapResponseEntity),
                                        calculateTotalHours(
                                          widget.generateRoadmapResponseEntity
                                              .roadmap,
                                        ),
                                      ),
                                    )
                                  : widget
                                      .generateRoadmapResponseEntity.progress,
                              userHoursPerWeek: widget
                                  .generateRoadmapResponseEntity
                                  .userHoursPerWeek,
                              totalWeeksCalculated: widget
                                  .generateRoadmapResponseEntity
                                  .totalWeeksCalculated,
                              roadmap: widget
                                  .generateRoadmapResponseEntity.roadmap
                                  .map((week) => RoadmapEntity(
                                        weekNumber: week.weekNumber,
                                        isCompleted: week !=
                                                widget.generateRoadmapResponseEntity
                                                        .roadmap[
                                                    widget
                                                        .generateRoadmapResponseEntity
                                                        .selectedIndex]
                                            ? week.isCompleted
                                            : true,
                                        skills: week.skills
                                            .map((skill) => SkillsEntity(
                                                  skillName: skill.skillName,
                                                  estimatedHours:
                                                      skill.estimatedHours,
                                                  resources: ResourcesEntity(
                                                    youtubeLink: skill
                                                        .resources.youtubeLink,
                                                    bookReference: skill
                                                        .resources
                                                        .bookReference,
                                                    articleLink: skill
                                                        .resources.articleLink,
                                                  ),
                                                ))
                                            .toList(),
                                      ))
                                  .toList(),
                            ),
                          ),
                        ),
                      );
                    }
                    if (state is SaveRoadmapError) {
                      AppDialogs.showSnackBar(
                          context: context, message: state.message);
                    }
                  },
                ),
              ],
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.r),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.emoji_events,
                        size: 100.sp, color: AppColors.orange.withAlpha(200)),
                    SizedBox(height: 20.h),
                    Text(
                      'Week completed!',
                      style: TextStyle(
                          fontSize: 24.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10.h),
                    Text.rich(
                      textAlign: TextAlign.center,
                      TextSpan(
                        text: 'You scored ',
                        style: TextStyle(
                          color: AppColors.secondary.withAlpha(200),
                          fontSize: 17.sp,
                        ),
                        children: [
                          TextSpan(
                            text: '${widget.score * 10}% ',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.black,
                            ),
                          ),
                          TextSpan(
                            text:
                                '— Week ${widget.weekNumber} is done. The next week is now unlocked!',
                            style: TextStyle(
                              fontSize: 17.sp,
                              color: AppColors.secondary.withAlpha(200),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Row(
                      children: [
                        Expanded(
                          child: SecondaryGradientButtonWidget(
                            title: 'Continue to next week',
                            onPressed: () async {
                              widget.generateRoadmapResponseEntity
                                          .selectedIndex ==
                                      widget.generateRoadmapResponseEntity
                                              .roadmap.length - 1
                                  ? await learnCubit.addFinishedTrack(
                                      AddFinishedTrackRequestEntity(
                                        track: widget
                                            .generateRoadmapResponseEntity
                                            .trackName,
                                      ),
                                    )
                                  : null;
                              widget
                                  .generateRoadmapResponseEntity
                                  .roadmap[widget.generateRoadmapResponseEntity
                                      .selectedIndex]
                                  .skills
                                  .map(
                                (skill) async {
                                  await learnCubit.addFinishedSkill(
                                    AddFinishedSkillRequestEntity(
                                      skill: skill.skillName,
                                    ),
                                  );
                                },
                              ).toList();
                              await learnCubit.saveRoadmap(
                                UserRoadmapModel(
                                  trackName: widget
                                      .generateRoadmapResponseEntity.trackName,
                                  selectedIndex: widget
                                          .generateRoadmapResponseEntity
                                          .selectedIndex +
                                      1,
                                  // selectedIndex: widget
                                  //         .generateRoadmapResponseEntity
                                  //         .selectedIndex +
                                  //     11,
                                  progress: widget.score >= 7
                                      ? int.parse(
                                          calculateProgress(
                                            calculateCompletedHours(widget
                                                .generateRoadmapResponseEntity),
                                            calculateTotalHours(
                                              widget
                                                  .generateRoadmapResponseEntity
                                                  .roadmap,
                                            ),
                                          ),
                                        )
                                      : widget.generateRoadmapResponseEntity
                                          .progress,
                                  userHoursPerWeek: widget
                                      .generateRoadmapResponseEntity
                                      .userHoursPerWeek,
                                  totalWeeksCalculated: widget
                                      .generateRoadmapResponseEntity
                                      .totalWeeksCalculated,
                                  roadmap: widget
                                      .generateRoadmapResponseEntity.roadmap
                                      .map((week) => RoadmapModel(
                                            weekNumber: week.weekNumber,
                                            isCompleted: week !=
                                                    widget.generateRoadmapResponseEntity
                                                            .roadmap[
                                                        widget
                                                            .generateRoadmapResponseEntity
                                                            .selectedIndex]
                                                ? week.isCompleted
                                                : true,
                                            skills: week.skills
                                                .map((skill) => SkillsModel(
                                                      skillName:
                                                          skill.skillName,
                                                      estimatedHours:
                                                          skill.estimatedHours,
                                                      resources: ResourcesModel(
                                                        youtubeLink: skill
                                                            .resources
                                                            .youtubeLink,
                                                        bookReference: skill
                                                            .resources
                                                            .bookReference,
                                                        articleLink: skill
                                                            .resources
                                                            .articleLink,
                                                      ),
                                                    ))
                                                .toList(),
                                          ))
                                      .toList(),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.r),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.sentiment_dissatisfied,
                    size: 100.sp,
                    color: AppColors.red.withAlpha(200),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'Not quite yet',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                      text: 'You scored ',
                      style: TextStyle(
                        color: AppColors.secondary.withAlpha(200),
                        fontSize: 17.sp,
                      ),
                      children: [
                        TextSpan(
                          text: '${widget.score * 10}% ',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.black,
                          ),
                        ),
                        TextSpan(
                          text:
                              '— You need 70% to unlock the next week. Review the material and try again.',
                          style: TextStyle(
                            fontSize: 17.sp,
                            color: AppColors.secondary.withAlpha(200),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Row(
                    spacing: 16.w,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: SecondaryGradientButtonWidget(
                          title: 'Try again',
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => WeekQuizPage(
                                  generateRoadmapResponseEntity:
                                      widget.generateRoadmapResponseEntity,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: SecondaryGradientButtonWidget(
                          title: 'Close',
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => RoadmapPage(
                                  learnCubit: learnCubit,
                                  generateRoadmapResponseEntity:
                                      GenerateRoadmapResponseEntity(),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }

  String calculateTotalHours(List<RoadmapEntity> roadmap) {
    int totalHours = 0;
    for (var week in roadmap) {
      for (var skill in week.skills) {
        totalHours += skill.estimatedHours;
      }
    }
    return totalHours.toString();
  }

  String calculateCompletedHours(
      GenerateRoadmapResponseEntity generateRoadmapResponseEntity) {
    int completedHours = 0;
    for (int i = 0; i <= generateRoadmapResponseEntity.selectedIndex; i++) {
      generateRoadmapResponseEntity.roadmap[i].skills.map((skill) {
        completedHours += skill.estimatedHours;
      }).toList();
    }
    return completedHours.toString();
  }

  String calculateProgress(String completedHours, String totalHours) {
    if (totalHours == '0') return '0';
    double progress =
        (double.parse(completedHours) / double.parse(totalHours)) * 100;
    return '${progress.round()}';
  }
}
