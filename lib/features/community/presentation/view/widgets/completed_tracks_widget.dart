import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syntra_ai/core/utils/app_colors.dart';

class CompletedTracksWidget extends StatelessWidget {
  final List<String> finishedTracks;
  const CompletedTracksWidget({super.key, required this.finishedTracks});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: finishedTracks.length,
      separatorBuilder: (context, index) => SizedBox(height: 12.h),
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.all(8.r),
          decoration: BoxDecoration(
            color: AppColors.primary,
            border: Border.all(
              color: AppColors.green,
            ),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            spacing: 8.w,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.school_outlined,
                color: const Color.fromARGB(255, 47, 201, 47),
                size: 24.sp,
              ),
              Text(
                finishedTracks[index],
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color.fromARGB(255, 47, 201, 47),
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
