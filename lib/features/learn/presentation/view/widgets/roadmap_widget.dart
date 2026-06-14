import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syntra_ai/core/utils/app_colors.dart';
import 'package:syntra_ai/core/utils/app_routes.dart';
import 'package:syntra_ai/core/view/widgets/secondary_gradient_button_widget.dart';
import 'package:syntra_ai/features/learn/data/model/user_roadmap_model.dart';
import 'package:syntra_ai/features/learn/domain/entities/generate_roadmap_response_entity.dart';
import 'package:syntra_ai/features/learn/presentation/view/widgets/row_item_widget.dart';
import 'package:syntra_ai/features/learn/presentation/view/widgets/week_details_widget.dart';
import 'package:syntra_ai/features/learn/presentation/view_model/learn_cubit.dart';

class RoadmapWidget extends StatefulWidget {
  final LearnCubit learnCubit;
  final GenerateRoadmapResponseEntity generateRoadmapResponseEntity;
  const RoadmapWidget(
      {super.key,
      required this.generateRoadmapResponseEntity,
      required this.learnCubit});

  @override
  State<RoadmapWidget> createState() => _RoadmapWidgetState();
}

class _RoadmapWidgetState extends State<RoadmapWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Column(
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
                    Icons.map_outlined,
                    color: AppColors.primary,
                    size: 28.sp,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'YOUR LEARNING ROADMAP',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: isLightMode
                              ? AppColors.blue
                              : AppColors.primary.withAlpha(200),
                        ),
                      ),
                      Text(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        widget.generateRoadmapResponseEntity.trackName,
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                          color:
                              isLightMode ? AppColors.purple : AppColors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RowItemWidget(
                    value: widget
                        .generateRoadmapResponseEntity.totalWeeksCalculated
                        .toString(),
                    title: 'WEEKS'),
                SizedBox(
                  height: 64.h,
                  child: VerticalDivider(
                    color: isLightMode
                        ? AppColors.secondary.withAlpha(100)
                        : AppColors.primary.withAlpha(150),
                    thickness: 1.r,
                    indent: 8.h,
                    endIndent: 10.h,
                  ),
                ),
                RowItemWidget(
                    value:
                        '${widget.generateRoadmapResponseEntity.userHoursPerWeek}h',
                    title: 'PER WEEK'),
                SizedBox(
                  height: 64.h,
                  child: VerticalDivider(
                    color: isLightMode
                        ? AppColors.secondary.withAlpha(100)
                        : AppColors.primary.withAlpha(150),
                    thickness: 1.r,
                    indent: 8.h,
                    endIndent: 10.h,
                  ),
                ),
                RowItemWidget(
                    value:
                        '${widget.generateRoadmapResponseEntity.progress.toString()}%',
                    title: 'PROGRESS'),
                SizedBox(
                  height: 64.h,
                  child: VerticalDivider(
                    color: isLightMode
                        ? AppColors.secondary.withAlpha(100)
                        : AppColors.primary.withAlpha(150),
                    thickness: 1.r,
                    indent: 8.h,
                    endIndent: 10.h,
                  ),
                ),
                RowItemWidget(
                  value:
                      '${calculateTotalHours(widget.generateRoadmapResponseEntity.roadmap)}h',
                  title: 'TOTAL',
                ),
              ],
            ),
            SizedBox(height: size.height * 0.03),
            Row(
              spacing: 24.w,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: SecondaryGradientButtonWidget(
                    title: 'Back to result',
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed(
                        AppRoutes.suggestedTrack,
                        arguments: {
                          'learnCubit': widget.learnCubit,
                          'suggestedTrack':
                              widget.generateRoadmapResponseEntity.trackName,
                        },
                      );
                    },
                  ),
                ),
                Expanded(
                  child: SecondaryGradientButtonWidget(
                    title: 'Restart',
                    icon: Icons.restart_alt_outlined,
                    onPressed: () {
                      // debugPrint(
                      // 'Progress: ${widget.generateRoadmapResponseEntity.progress}');
                      setState(() {
                        widget.generateRoadmapResponseEntity.selectedIndex = 0;
                        widget.generateRoadmapResponseEntity.progress = 0;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.03),
            SizedBox(
              height: 80.h,
              child: ListView.builder(
                padding: EdgeInsets.only(left: 2.w, top: 4.h),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 36.w,
                            height: 36.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: widget.generateRoadmapResponseEntity
                                          .selectedIndex ==
                                      index
                                  ? isLightMode
                                      ? AppColors.purple
                                      : AppColors.blue
                                  : widget.generateRoadmapResponseEntity
                                              .selectedIndex >
                                          index
                                      ? isLightMode
                                          ? AppColors.purple.withAlpha(30)
                                          : AppColors.blue.withAlpha(30)
                                      : isLightMode
                                          ? AppColors.secondary.withAlpha(20)
                                          : AppColors.primary.withAlpha(20),
                              border: widget.generateRoadmapResponseEntity
                                          .selectedIndex ==
                                      index
                                  ? Border.all(
                                      color: isLightMode
                                          ? AppColors.blue
                                          : AppColors.primary.withAlpha(200),
                                      width: 2.w,
                                      strokeAlign:
                                          BorderSide.strokeAlignOutside,
                                    )
                                  : Border.all(
                                      color: isLightMode
                                          ? AppColors.secondary.withAlpha(150)
                                          : AppColors.primary.withAlpha(150),
                                      width: 2.w,
                                      strokeAlign:
                                          BorderSide.strokeAlignOutside,
                                    ),
                            ),
                            child: widget.generateRoadmapResponseEntity
                                        .selectedIndex >
                                    index
                                ? Icon(
                                    Icons.check,
                                    size: 24.sp,
                                    fontWeight: FontWeight.bold,
                                    color: isLightMode
                                        ? AppColors.purple
                                        : AppColors.blue,
                                  )
                                : widget.generateRoadmapResponseEntity
                                            .selectedIndex ==
                                        index
                                    ? Text(
                                        '${index + 1}',
                                        style: TextStyle(
                                          color:
                                              widget.generateRoadmapResponseEntity
                                                          .selectedIndex ==
                                                      index
                                                  ? isLightMode
                                                      ? AppColors.primary
                                                      : AppColors.primary
                                                          .withAlpha(200)
                                                  : isLightMode
                                                      ? AppColors.secondary
                                                      : AppColors.primary
                                                          .withAlpha(180),
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    : Icon(
                                        Icons.lock_outline,
                                        size: 24.sp,
                                        color: isLightMode
                                            ? AppColors.secondary.withAlpha(150)
                                            : AppColors.primary.withAlpha(150),
                                      ),
                          ),
                          index ==
                                  widget.generateRoadmapResponseEntity.roadmap
                                          .length -
                                      1
                              ? const SizedBox.shrink()
                              : SizedBox(
                                  width: 48.w,
                                  child: Divider(
                                    color: isLightMode
                                        ? index <
                                                widget
                                                    .generateRoadmapResponseEntity
                                                    .selectedIndex
                                            ? AppColors.purple
                                            : AppColors.secondary.withAlpha(150)
                                        : index <
                                                widget
                                                    .generateRoadmapResponseEntity
                                                    .selectedIndex
                                            ? AppColors.blue
                                            : AppColors.secondary
                                                .withAlpha(150),
                                    thickness: 2.r,
                                    indent: 0.w,
                                    endIndent: 0.w,
                                  ),
                                ),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        '${calculateHoursperWeek(widget.generateRoadmapResponseEntity.roadmap[index])}h',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w800,
                          color: widget.generateRoadmapResponseEntity
                                      .selectedIndex ==
                                  index
                              ? isLightMode
                                  ? AppColors.purple
                                  : AppColors.blue
                              : isLightMode
                                  ? AppColors.secondary
                                  : AppColors.primary.withAlpha(150),
                        ),
                      ),
                    ],
                  );
                },
                // separatorBuilder: (_, __) => SizedBox(width: 12.w),
                itemCount:
                    widget.generateRoadmapResponseEntity.totalWeeksCalculated,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 24.h,
                crossAxisSpacing: 12.w,
                childAspectRatio: 1.5.r,
              ),
              itemCount:
                  widget.generateRoadmapResponseEntity.totalWeeksCalculated,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: widget.generateRoadmapResponseEntity
                                  .selectedIndex >=
                              index
                          ? () {
                              Navigator.of(context)
                                  .push(
                                MaterialPageRoute(
                                  builder: (context) => WeekDetailsWidget(
                                    generateRoadmapResponseEntity:
                                        widget.generateRoadmapResponseEntity,
                                    weekIndex: index,
                                    hoursPerWeek: calculateHoursperWeek(widget
                                        .generateRoadmapResponseEntity
                                        .roadmap[index]),
                                  ),
                                ),
                              )
                                  .then((_) {
                                widget.generateRoadmapResponseEntity
                                            .selectedIndex >
                                        index
                                    ? null
                                    : setState(() {
                                        widget.generateRoadmapResponseEntity
                                            .selectedIndex = index;
                                      });
                              });
                            }
                          : null,
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(4.r),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: widget.generateRoadmapResponseEntity
                                      .selectedIndex ==
                                  index
                              ? isLightMode
                                  ? AppColors.purple
                                  : AppColors.blue
                              : widget.generateRoadmapResponseEntity
                                          .selectedIndex >
                                      index
                                  ? isLightMode
                                      ? AppColors.purple.withAlpha(30)
                                      : AppColors.blue.withAlpha(30)
                                  : isLightMode
                                      ? AppColors.secondary.withAlpha(20)
                                      : AppColors.primary.withAlpha(20),
                          gradient: widget.generateRoadmapResponseEntity
                                      .selectedIndex ==
                                  index
                              ? LinearGradient(
                                  colors: [AppColors.purple, AppColors.blue],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                )
                              : null,
                          border: Border.all(
                            color: widget.generateRoadmapResponseEntity
                                        .selectedIndex ==
                                    index
                                ? isLightMode
                                    ? AppColors.blue
                                    : AppColors.primary.withAlpha(200)
                                : isLightMode
                                    ? AppColors.secondary.withAlpha(150)
                                    : AppColors.primary.withAlpha(150),
                            width: 2.r,
                            strokeAlign: BorderSide.strokeAlignOutside,
                          ),
                        ),
                        child: widget.generateRoadmapResponseEntity
                                    .selectedIndex >
                                index
                            ? Icon(
                                Icons.check,
                                size: 24.sp,
                                fontWeight: FontWeight.bold,
                                color: isLightMode
                                    ? AppColors.purple
                                    : AppColors.blue,
                              )
                            : widget.generateRoadmapResponseEntity
                                        .selectedIndex ==
                                    index
                                ? Text(
                                    '${index + 1}',
                                    style: TextStyle(
                                      color: widget
                                                  .generateRoadmapResponseEntity
                                                  .selectedIndex ==
                                              index
                                          ? AppColors.primary
                                          : isLightMode
                                              ? AppColors.secondary
                                                  .withAlpha(200)
                                              : AppColors.primary
                                                  .withAlpha(200),
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                : Icon(
                                    Icons.lock_outline,
                                    size: 24.sp,
                                    color: isLightMode
                                        ? AppColors.secondary.withAlpha(150)
                                        : AppColors.primary.withAlpha(150),
                                  ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Week ${index + 1}',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: widget.generateRoadmapResponseEntity
                                    .selectedIndex ==
                                index
                            ? isLightMode
                                ? AppColors.purple
                                : AppColors.blue
                            : isLightMode
                                ? AppColors.black
                                : AppColors.primary.withAlpha(230),
                      ),
                    ),
                    Text(
                      widget.generateRoadmapResponseEntity.roadmap[index].skills
                                  .length ==
                              1
                          ? '1 skill . ${calculateHoursperWeek(widget.generateRoadmapResponseEntity.roadmap[index])}h'
                          : '${widget.generateRoadmapResponseEntity.roadmap[index].skills.length} skills . ${calculateHoursperWeek(widget.generateRoadmapResponseEntity.roadmap[index])}h',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: isLightMode
                            ? AppColors.black.withAlpha(150)
                            : AppColors.primary.withAlpha(120),
                      ),
                    ),
                  ],
                );
              },
            ),
            Row(
              children: [
                Expanded(
                  child: SecondaryGradientButtonWidget(
                    title: 'Save Roadmap',
                    onPressed: () async {
                      try {
                        await widget.learnCubit.saveRoadmap(
                          UserRoadmapModel(
                            trackName:
                                widget.generateRoadmapResponseEntity.trackName,
                            selectedIndex: widget
                                .generateRoadmapResponseEntity.selectedIndex,
                            progress:
                                widget.generateRoadmapResponseEntity.progress,
                            userHoursPerWeek: widget
                                .generateRoadmapResponseEntity.userHoursPerWeek,
                            totalWeeksCalculated: widget
                                .generateRoadmapResponseEntity
                                .totalWeeksCalculated,
                            roadmap:
                                widget.generateRoadmapResponseEntity.roadmap
                                    .map((week) => RoadmapModel(
                                          weekNumber: week.weekNumber,
                                          isCompleted: week.isCompleted,
                                          skills: week.skills
                                              .map((skill) => SkillsModel(
                                                    skillName: skill.skillName,
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
                      } catch (e, s) {
                        debugPrint('saveRoadmap failed: $e');
                        debugPrintStack(stackTrace: s);
                      }
                    },
                  ),
                ),
              ],
            ),
            widget.generateRoadmapResponseEntity.selectedIndex >
                    widget.generateRoadmapResponseEntity.totalWeeksCalculated -
                        1
                ? Column(
                    children: [
                      SizedBox(height: size.height * 0.02),
                      Row(
                        children: [
                          Expanded(
                            child: SecondaryGradientButtonWidget(
                              title: 'Go to learning project',
                              onPressed: () {
                                Navigator.of(context).pushNamed(
                                  AppRoutes.learningProject,
                                  arguments: {
                                    'learnCubit': widget.learnCubit,
                                    'generateRoadmapResponseEntity':
                                        widget.generateRoadmapResponseEntity,
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                : const SizedBox.shrink(),
            SizedBox(height: size.height * 0.04),
          ],
        ),
      ),
    );
  }

  String calculateTotalHours(List<RoadmapEntity> roadmap) {
    int totalHours = 0;
    roadmap.map((week) {
      week.skills.map((skill) {
        totalHours += skill.estimatedHours;
      }).toList();
    }).toList();
    return totalHours.toString();
  }

  String calculateHoursperWeek(RoadmapEntity week) {
    int totalHours = 0;
    week.skills.map((skill) {
      totalHours += skill.estimatedHours;
    }).toList();
    return totalHours.toString();
  }
}
