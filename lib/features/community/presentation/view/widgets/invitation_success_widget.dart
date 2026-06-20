import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syntra_ai/core/utils/app_colors.dart';
import 'package:syntra_ai/core/view/widgets/secondary_gradient_button_widget.dart';

class InvitationSuccessWidget extends StatelessWidget {
  final String name;
  final String selectedTrack;
  const InvitationSuccessWidget({super.key, required this.name, required this.selectedTrack});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.r,
        vertical: 48.r,
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green.withAlpha(51),
            ),
            child: Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 48.sp,
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            'SUCCESS',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Invite sent!',
            style: TextStyle(
              color: AppColors.black,
              fontSize: 23.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8.h),
          Text.rich(
            textAlign: TextAlign.center,
            TextSpan(
              text: name,
              style: TextStyle(
                color: AppColors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
              children: [
                TextSpan(
                  text: ' will see a mock interview invitation for ',
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: selectedTrack,
                  style: TextStyle(
                    color: AppColors.purple,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: ' on their Tech page.',
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 36.h),
          Row(
            children: [
              Expanded(
                child: SecondaryGradientButtonWidget(
                  title: 'Done', 
                  onPressed: (){
                    Navigator.of(context, rootNavigator: true).pop();
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
