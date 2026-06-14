import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syntra_ai/core/utils/app_colors.dart';
import 'package:syntra_ai/features/profile/domain/entities/user_data_response_entity.dart';

class FinishedTracksWidget extends StatelessWidget {
  final UserDataResponseEntity userDataResponseEntity;
  const FinishedTracksWidget({super.key, required this.userDataResponseEntity});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        border: Border.all(
          color: isLightMode
              ? Color.fromARGB(181, 16, 230, 169)
              : AppColors.primary.withAlpha(150),
          width: 1.2.r,
        ),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(6.r),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 12, 172, 126),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Icon(
                      Icons.verified_outlined,
                      size: 32.sp,
                      color: const Color.fromARGB(255, 5, 255, 5).withAlpha(200),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'COMPLETED TRACKS',
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          color: isLightMode
                              ? AppColors.secondary
                              : AppColors.primary.withAlpha(220),
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'Verified on Syntra.AI',
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w700,
                          color: isLightMode
                              ? AppColors.black
                              : AppColors.primary.withAlpha(170),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: isLightMode
                      ? Color.fromARGB(97, 23, 179, 135)
                      : AppColors.blue.withAlpha(160),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  userDataResponseEntity.user.finishedTracks.length == 1
                      ? '${userDataResponseEntity.user.finishedTracks.length} Track'
                      : '${userDataResponseEntity.user.finishedTracks.length} Tracks',
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 6, 97, 71),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: size.height * 0.02),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12.h,
              crossAxisSpacing: 12.w,
              childAspectRatio: 4,
            ),
            itemCount: userDataResponseEntity.user.finishedTracks.length,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isLightMode
                        ? Color.fromARGB(97, 23, 179, 135)
                        : AppColors.blue.withAlpha(160),
                    width: 1.5.r,
                  ),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 6.w,
                  children: [
                    Icon(
                      Icons.map_outlined,
                      size: 24.sp,
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(131, 21, 185, 139),
                    ),
                    Text(
                      userDataResponseEntity.user.finishedTracks[index],
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 6, 97, 71),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
