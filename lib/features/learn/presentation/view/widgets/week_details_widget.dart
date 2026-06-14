import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syntra_ai/core/utils/app_colors.dart';
import 'package:syntra_ai/core/utils/app_routes.dart';
import 'package:syntra_ai/core/view/widgets/secondary_gradient_button_widget.dart';
import 'package:syntra_ai/features/learn/domain/entities/generate_roadmap_response_entity.dart';
import 'package:syntra_ai/features/learn/presentation/view/widgets/resources_item_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class WeekDetailsWidget extends StatelessWidget {
  final GenerateRoadmapResponseEntity generateRoadmapResponseEntity;
  final int weekIndex;
  final String hoursPerWeek;
  const WeekDetailsWidget(
      {super.key,
      required this.generateRoadmapResponseEntity,
      required this.weekIndex,
      required this.hoursPerWeek});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Week Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: size.width * 0.34,
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: AppColors.purple.withAlpha(20),
                  borderRadius: BorderRadius.circular(36.r),
                ),
                child: Row(
                  spacing: 12.w,
                  children: [
                    Icon(
                      Icons.map_outlined,
                      color: AppColors.purple,
                      size: 24.sp,
                    ),
                    Text(
                      'WEEK ${generateRoadmapResponseEntity.roadmap[weekIndex].weekNumber}',
                      style: TextStyle(
                        color: AppColors.purple,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        generateRoadmapResponseEntity.roadmap[weekIndex].skills[index].skillName,
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time_outlined,
                            size: 24.sp,
                            color: AppColors.secondary,
                          ),
                          SizedBox(width: 12.w),
                          Text(
                            '${generateRoadmapResponseEntity.roadmap[weekIndex].skills[index].estimatedHours} hours to master',
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: AppColors.secondary,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 32.h),
                      Container(
                        padding: EdgeInsets.all(12.w),
                        decoration: BoxDecoration(
                          color: AppColors.gray.withAlpha(45),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.speed_outlined,
                                      size: 24.sp,
                                      color: AppColors.orange,
                                    ),
                                    SizedBox(width: 12.w),
                                    Text(
                                      'EFFORT INTENSITY',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        color: AppColors.secondary,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  '${generateRoadmapResponseEntity.roadmap[weekIndex].skills[index].estimatedHours}H',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: AppColors.semiBlack.withAlpha(200),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 12.h),
                            Stack(
                              children: [
                                Container(
                                  height: 8.h,
                                  decoration: BoxDecoration(
                                    color: AppColors.secondary.withAlpha(30),
                                    borderRadius: BorderRadius.circular(4.r),
                                  ),
                                ),
                                Container(
                                  height: 8.h,
                                  width: (int.parse(generateRoadmapResponseEntity.roadmap[weekIndex].skills[index].estimatedHours.toString()) /
                                          40) *
                                      (size.width - 64.w),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        AppColors.blue,
                                        AppColors.purple,
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(4.r),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 32.h),
                      Text(
                        'CURATED RESOURCES',
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: AppColors.semiBlack.withAlpha(200),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      generateRoadmapResponseEntity.roadmap[weekIndex].skills[index].resources.youtubeLink.isNotEmpty
                          ? ResourcesItemWidget(
                              icon: Icons.youtube_searched_for_outlined,
                              iconColor: AppColors.red.withAlpha(200),
                              title: 'VIDEO TUTORIAL',
                              link: generateRoadmapResponseEntity.roadmap[weekIndex].skills[index].resources.youtubeLink,
                              onPressed: () => openLink(generateRoadmapResponseEntity.roadmap[weekIndex].skills[index].resources.youtubeLink),
                            )
                          : const SizedBox.shrink(),
                      SizedBox(height: 16.h),
                      generateRoadmapResponseEntity.roadmap[weekIndex].skills[index].resources.bookReference.isNotEmpty
                          ? ResourcesItemWidget(
                              icon: Icons.book_outlined,
                              iconColor: AppColors.orange.withAlpha(200),
                              title: 'BOOK REFERENCE',
                              link: generateRoadmapResponseEntity.roadmap[weekIndex]
                                  .skills[index].resources.bookReference,
                            )
                          : const SizedBox.shrink(),
                      SizedBox(height: 16.h),
                      generateRoadmapResponseEntity.roadmap[weekIndex]
                              .skills[index].resources.articleLink.isNotEmpty
                          ? ResourcesItemWidget(
                              icon: Icons.article_outlined,
                              iconColor: AppColors.blue.withAlpha(200),
                              title: 'DEEP-DIVE ARTICLE',
                              link: generateRoadmapResponseEntity.roadmap[weekIndex]
                                  .skills[index].resources.articleLink,
                              onPressed: () => openLink(generateRoadmapResponseEntity.roadmap[weekIndex]
                                  .skills[index].resources.articleLink),
                            )
                          : const SizedBox.shrink(),
                    ],
                  );
                },
                separatorBuilder: (_, __) => Column(
                  children: [
                    SizedBox(height: 36.h),
                    SizedBox(
                      height: size.height * 0.01,
                      child: Divider(
                        indent: 12.w,
                        endIndent: 12.w,
                        color: AppColors.secondary.withAlpha(100),
                        thickness: 1.5.r,
                      ),
                    ),
                    SizedBox(height: 36.h),
                  ],
                ),
                itemCount: generateRoadmapResponseEntity.roadmap[weekIndex].skills.length,
              ),
              SizedBox(height: 16.h),
              weekIndex < generateRoadmapResponseEntity.selectedIndex
                  ? Align(
                    alignment: Alignment.center,
                    child: Text(
                        'Week ${generateRoadmapResponseEntity.roadmap[weekIndex].weekNumber} completed! Great job!',
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: AppColors.green,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                  )
                  : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ready to unlock the next week?',
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: AppColors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          'Study this week\'s resources, then pass the quiz (70%+) to continue.',
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: AppColors.secondary,
                          ),
                        ),
                        SizedBox(height: 24.h),
                        Row(
                          children: [
                            Expanded(
                              child: SecondaryGradientButtonWidget(
                                title:
                                    'Take Week ${generateRoadmapResponseEntity.roadmap[generateRoadmapResponseEntity.selectedIndex].weekNumber} Quiz',
                                onPressed: () {
                                  Navigator.of(context).pushNamed(
                                      AppRoutes.weekQuiz,
                                      arguments: generateRoadmapResponseEntity,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
              SizedBox(height: 36.h),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> openLink(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }
}
