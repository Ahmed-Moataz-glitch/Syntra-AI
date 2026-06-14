import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syntra_ai/core/utils/app_dialogs.dart';
import 'package:syntra_ai/features/learn/domain/entities/generate_roadmap_response_entity.dart';
import 'package:syntra_ai/features/learn/presentation/view/widgets/roadmap_widget.dart';
import 'package:syntra_ai/features/learn/presentation/view_model/learn_cubit.dart';

class RoadmapPage extends StatefulWidget {
  final LearnCubit learnCubit;
  final GenerateRoadmapResponseEntity generateRoadmapResponseEntity;
  const RoadmapPage(
      {super.key,
      required this.generateRoadmapResponseEntity,
      required this.learnCubit});

  @override
  State<RoadmapPage> createState() => _RoadmapPageState();
}

class _RoadmapPageState extends State<RoadmapPage> {
  @override
  void initState() {
    super.initState();
    widget.generateRoadmapResponseEntity.roadmap.isEmpty
        ? widget.learnCubit.getUserRoadmap()
        : null;
  }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Roadmap Page'),
      ),
      body: 
      BlocConsumer<LearnCubit, LearnState>(
        bloc: widget.learnCubit,
        listenWhen: (previous, current) =>
            current is SaveRoadmapLoading ||
            current is SaveRoadmapSuccess ||
            current is SaveRoadmapError ||
            current is GetSavedRoadmapError,
        buildWhen: (previous, current) => current is GetSavedRoadmapSuccess,
        listener: (context, state) {
          if (state is SaveRoadmapLoading) {
            AppDialogs.showLoadingDialog(context, title: 'Saving roadmap...');
          }
          if (state is SaveRoadmapSuccess) {
            Navigator.of(context, rootNavigator: true).pop();
            AppDialogs.showSnackBar(
                context: context, message: 'Roadmap saved successfully!');
          }
          if (state is SaveRoadmapError) {
            Navigator.of(context, rootNavigator: true).pop();
            AppDialogs.showSnackBar(
                context: context, message: state.message, isError: true);
          }
          if (state is GetSavedRoadmapError) {
            AppDialogs.showSnackBar(
                context: context, message: state.message, isError: true);
          }
        },
        builder: (context, state) {
          if (state is GetSavedRoadmapSuccess) {
            final userRoadmap = state.userRoadmapModel;
            return SingleChildScrollView(
              child: Column(
                children: [
                  RoadmapWidget(
                    learnCubit: widget.learnCubit,
                    generateRoadmapResponseEntity:
                        GenerateRoadmapResponseEntity(
                      trackName: userRoadmap.trackName,
                      selectedIndex: userRoadmap.selectedIndex,
                      progress: userRoadmap.progress,
                      userHoursPerWeek: userRoadmap.userHoursPerWeek,
                      totalWeeksCalculated: userRoadmap.totalWeeksCalculated,
                      roadmap: userRoadmap.roadmap
                          .map((week) => RoadmapEntity(
                                weekNumber: week.weekNumber,
                                skills: week.skills
                                    .map((skill) => SkillsEntity(
                                          skillName: skill.skillName,
                                          estimatedHours: skill.estimatedHours,
                                          resources: ResourcesEntity(
                                            youtubeLink:
                                                skill.resources.youtubeLink,
                                            bookReference:
                                                skill.resources.bookReference,
                                            articleLink:
                                                skill.resources.articleLink,
                                          ),
                                        ))
                                    .toList(),
                              ))
                          .toList(),
                    ),
                  ),
                ],
              ),
            );
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                RoadmapWidget(
                  learnCubit: widget.learnCubit,
                  generateRoadmapResponseEntity:
                      widget.generateRoadmapResponseEntity,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
