import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syntra_ai/core/utils/app_colors.dart';
import 'package:syntra_ai/features/learn/domain/entities/evaluation_result_response_entity.dart';

class RequirementsWidget extends StatelessWidget {
  final List<RequirementsMetEntity> requirementsMet;
  const RequirementsWidget({super.key, required this.requirementsMet});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.all(8.r),
          decoration: BoxDecoration(
            color: requirementsMet[index].status
                ? Colors.green.withAlpha(30)
                : Colors.red.withAlpha(30),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            spacing: 8.w,
            children: [
              Icon(
                requirementsMet[index].status
                    ? Icons.check_circle
                    : Icons.cancel,
                color:
                    requirementsMet[index].status
                        ? Colors.green
                        : Colors.red,
                size: 24.sp,
              ),
              Expanded(
                child: Text(
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  requirementsMet[index].feature,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColors.black,
                  ),
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: 8.h),
      itemCount: requirementsMet.length,
    );
  }
}
