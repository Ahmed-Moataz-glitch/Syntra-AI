import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syntra_ai/core/utils/app_colors.dart';
import 'package:syntra_ai/core/utils/app_localization.dart';
import 'package:syntra_ai/features/learn/data/model/member_model.dart';
import 'package:syntra_ai/features/learn/presentation/view/widgets/add_member_widget.dart';
import 'package:syntra_ai/generated/l10n.dart';

class TeamPageViewWidget extends StatefulWidget {
  const TeamPageViewWidget({super.key});

  @override
  State<TeamPageViewWidget> createState() => _TeamPageViewWidgetState();
}

class _TeamPageViewWidgetState extends State<TeamPageViewWidget> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // memberNameController.dispose();
    // memberSkillsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    final isArabic = AppLocalization.isArabic();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16.h,
      children: [
        Row(
          spacing: 16.w,
          children: [
            Container(
              width: 48.w,
              height: 48.h,
              decoration: BoxDecoration(
                color: isLightMode ? AppColors.purple.withAlpha(30) : AppColors.blue.withAlpha(80),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(
                Icons.group,
                size: 32.sp,
                color: isLightMode ? AppColors.purple : AppColors.blue,
              ),
            ),
            Text(
              S.of(context).team_page_view_title1,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                color: isLightMode
                    ? AppColors.black
                    : AppColors.primary.withAlpha(240),
              ),
            ),
          ],
        ),
        Text(
          S.of(context).team_page_view_title2,
          style: TextStyle(
            fontSize: isArabic ? 15.sp : 14.sp,
            fontWeight: isArabic ? FontWeight.w700 : null,
            color: isLightMode
                ? AppColors.black.withAlpha(160)
                : AppColors.primary.withAlpha(220),
          ),
        ),
        SizedBox(height: size.height * 0.01),
        AddMemberWidget(
          members: members,
        ),
      ],
    );
  }
}
