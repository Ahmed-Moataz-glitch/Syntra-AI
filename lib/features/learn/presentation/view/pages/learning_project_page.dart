import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syntra_ai/core/utils/app_colors.dart';
import 'package:syntra_ai/core/utils/app_dialogs.dart';
import 'package:syntra_ai/core/utils/app_toast.dart';
import 'package:syntra_ai/core/utils/shared_preferences.dart';
import 'package:syntra_ai/core/view/widgets/secondary_gradient_button_widget.dart';
import 'package:syntra_ai/features/auth/presentation/view/widgets/text_form_field_widget.dart';
import 'package:syntra_ai/features/auth/presentation/view/widgets/validator.dart';
import 'package:syntra_ai/features/learn/domain/entities/evaluate_project_request_entity.dart';
import 'package:syntra_ai/features/learn/domain/entities/generate_roadmap_response_entity.dart';
import 'package:syntra_ai/features/learn/domain/entities/recommended_projects_request_entity.dart';
import 'package:syntra_ai/features/learn/presentation/view/pages/evaluation_result_page.dart';
import 'package:syntra_ai/features/learn/presentation/view/widgets/recommended_projects_item_widget.dart';
import 'package:syntra_ai/features/learn/presentation/view_model/learn_cubit.dart';
import 'package:toastification/toastification.dart';

class LearningProjectPage extends StatefulWidget {
  final LearnCubit learnCubit;
  final GenerateRoadmapResponseEntity generateRoadmapResponseEntity;
  const LearningProjectPage(
      {super.key,
      required this.learnCubit,
      required this.generateRoadmapResponseEntity});

  @override
  State<LearningProjectPage> createState() => _LearningProjectPageState();
}

class _LearningProjectPageState extends State<LearningProjectPage> {
  List<String> skills = [];
  String selectedProject = '';
  late final TextEditingController projectLinkController;
  late final TextEditingController projectDescriptionController;
  late final String studentId;

  @override
  void initState() {
    projectLinkController = TextEditingController();
    projectDescriptionController = TextEditingController();
    skills = getSkills();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      studentId = await FlutterSharedPreferences.instance.getStudentId();
      await widget.learnCubit.recommendedProjects(
        RecommendedProjectsRequestEntity(
          track: widget.generateRoadmapResponseEntity.trackName,
          technologies: skills,
        ),
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    projectLinkController.dispose();
    projectDescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLightMode =
        Theme.of(context).brightness == Brightness.light ? true : false;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learning Project Page'),
      ),
      body: BlocConsumer<LearnCubit, LearnState>(
        bloc: widget.learnCubit,
        listenWhen: (previous, current) =>
            current is RecommendedProjectsLoading ||
            current is RecommendedProjectsSuccess ||
            current is RecommendedProjectsError,
        buildWhen: (previous, current) => current is RecommendedProjectsSuccess,
        listener: (context, state) {
          if (state is RecommendedProjectsLoading) {
            AppDialogs.showLoadingDialog(context,
                title: 'Generating Recommended Projects...');
          }
          if (state is RecommendedProjectsSuccess) {
            Navigator.of(context, rootNavigator: true).pop();
          }
          if (state is RecommendedProjectsError) {
            Navigator.of(context, rootNavigator: true).pop();
            AppToast.showToast(
                context: context,
                title: 'Error',
                description: state.message,
                type: ToastificationType.error);
          }
        },
        builder: (context, state) {
          if (state is RecommendedProjectsSuccess) {
            final recommendedProjects = state.recommendedProjectsResponseEntity;
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 24.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      spacing: 16.w,
                      children: [
                        Container(
                          padding: EdgeInsets.all(12.r),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: isLightMode
                                  ? [Colors.purple, Colors.blue]
                                  : [Colors.blue, Colors.purple],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Icon(
                            Icons.emoji_events_outlined,
                            color: AppColors.primary,
                            size: 28.sp,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'TRACK COMPLETE',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                  color: isLightMode
                                      ? AppColors.purple
                                      : AppColors.primary.withAlpha(200),
                                ),
                              ),
                              Text(
                                'Your capstone project ideas',
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600,
                                  color: isLightMode
                                      ? AppColors.black
                                      : AppColors.blue.withAlpha(200),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      'Based on ${widget.generateRoadmapResponseEntity.trackName} and the skills you mastered across all weeks.',
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: isLightMode
                            ? AppColors.secondary.withAlpha(200)
                            : AppColors.blue,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: skills.length,
                      itemBuilder: (context, index) {
                        final skill = skills[index];
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 8.h),
                          padding: EdgeInsets.all(12.r),
                          decoration: BoxDecoration(
                            color: isLightMode
                                ? AppColors.purple.withAlpha(30)
                                : AppColors.blue.withAlpha(15),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Text(
                            skill,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: isLightMode
                                  ? AppColors.purple
                                  : AppColors.blue,
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 24.h),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final project = recommendedProjects.projects[index];
                        return RecommendedProjectsItemWidget(
                          project: project,
                        );
                      },
                      separatorBuilder: (_, __) => SizedBox(height: 16.h),
                      itemCount: recommendedProjects.projects.length,
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Submit your finished project',
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.bold,
                        color: isLightMode
                            ? AppColors.black
                            : AppColors.primary.withAlpha(200),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Pick one of the suggested ideas, share your repo link, and get AI feedback on your work.',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: isLightMode
                            ? AppColors.secondary.withAlpha(200)
                            : AppColors.blue,
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      'Which project did you build?',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: isLightMode ? AppColors.black : AppColors.blue,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    DropdownButton(
                      isExpanded: true,
                      padding: EdgeInsets.all(4.r),
                      value: selectedProject == ''
                          ? recommendedProjects.projects.first.projectTitle
                          : selectedProject,
                      items: recommendedProjects.projects
                          .map(
                            (project) => DropdownMenuItem(
                              value: project.projectTitle,
                              child: Text(
                                project.projectTitle,
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  color: isLightMode
                                      ? AppColors.black
                                      : AppColors.blue,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedProject = value!;
                        });
                      },
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Project link (GitHub, demo, etc.)',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: isLightMode ? AppColors.black : AppColors.blue,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    SizedBox(
                      height: size.height * 0.05,
                      child: TextFormFieldWidget(
                        controller: projectLinkController,
                        validator: Validator.validateName,
                        hintText: 'https://github.com/username/project',
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Project description',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: isLightMode ? AppColors.black : AppColors.blue,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    SizedBox(
                      height: size.height * 0.2,
                      child: TextFormFieldWidget(
                        controller: projectDescriptionController,
                        validator: Validator.validateName,
                        hintText: recommendedProjects.projects.first.overview,
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Row(
                      children: [
                        Expanded(
                          child: SecondaryGradientButtonWidget(
                            title: 'Submit for evaluation',
                            icon: Icons.send,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => EvaluationResultPage(
                                    learnCubit: widget.learnCubit,
                                    evaluateProjectRequestEntity: EvaluateProjectRequestEntity(
                                      studentId: studentId,
                                      trackId: widget.generateRoadmapResponseEntity.trackName,
                                      projectLink: projectLinkController.text.trim(),
                                      projectDescription:
                                          projectDescriptionController.text.trim(),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 32.h),
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

  List<String> getSkills() {
    List<String> skills = [];
    for (var week in widget.generateRoadmapResponseEntity.roadmap) {
      for (var skill in week.skills) {
        skills.add(skill.skillName);
      }
    }
    return skills;
  }
}
