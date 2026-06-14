import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syntra_ai/core/utils/app_colors.dart';
import 'package:syntra_ai/core/utils/app_localization.dart';
import 'package:syntra_ai/features/auth/presentation/view/widgets/text_form_field_widget.dart';
import 'package:syntra_ai/features/auth/presentation/view/widgets/validator.dart';
import 'package:syntra_ai/features/learn/data/model/member_model.dart';
import 'package:syntra_ai/generated/l10n.dart';

int currentMember = 1;

class AddMemberWidget extends StatefulWidget {
  final List<MemberModel> members;
  const AddMemberWidget({super.key, required this.members});

  @override
  State<AddMemberWidget> createState() => _AddMemberWidgetState();
}

class _AddMemberWidgetState extends State<AddMemberWidget> {
  @override
  void dispose() {
    for (var member in widget.members) {
      member.memberSkills.clear();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    final isArabic = AppLocalization.isArabic();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      right: 12.w, left: 12.w, top: 36.h, bottom: 16.h),
                  margin: EdgeInsets.symmetric(horizontal: 4.w),
                  decoration: BoxDecoration(
                    color: isLightMode
                        ? AppColors.purple.withAlpha(12)
                        : AppColors.dark.withAlpha(220),
                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow: !isLightMode
                        ? [
                            BoxShadow(
                              color: AppColors.blue.withAlpha(70),
                              blurRadius: 3.r,
                              spreadRadius: 2.r,
                              offset: const Offset(1, 2),
                            ),
                          ]
                        : null,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).add_member_title1,
                        style: TextStyle(
                          fontSize: isArabic ? 15.sp : 12.sp,
                          fontWeight: isArabic ? FontWeight.w700 : null,
                          color: isLightMode
                              ? AppColors.secondary
                              : AppColors.primary.withAlpha(220),
                        ),
                      ),
                      SizedBox(height: size.height * 0.01),
                      SizedBox(
                        width: size.width * 0.6,
                        height: size.height * 0.05,
                        child: TextFormFieldWidget(
                          hintText: S.of(context).add_member_title1_hint_text,
                          controller:
                              widget.members[index].memberNameController,
                          validator: Validator.validateName,
                        ),
                      ),
                      SizedBox(height: size.height * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                S.of(context).add_member_title2,
                                style: TextStyle(
                                  fontSize: isArabic ? 15.sp : 12.sp,
                                  fontWeight: isArabic ? FontWeight.w700 : null,
                                  color: isLightMode
                                      ? AppColors.secondary
                                      : AppColors.primary.withAlpha(220),
                                ),
                              ),
                              SizedBox(height: size.height * 0.01),
                              SizedBox(
                                width: size.width * 0.6,
                                height: size.height * 0.05,
                                child: TextFormFieldWidget(
                                  controller: widget
                                      .members[index].memberSkillsController,
                                  validator: Validator.validateName,
                                  hintText:
                                      S.of(context).add_member_title2_hint_text,
                                ),
                              ),
                            ],
                          ),
                          IconButton.filled(
                            padding: EdgeInsets.all(4.r),
                            onPressed: () {
                              final skill = widget
                                  .members[index].memberSkillsController.text
                                  .trim();
                              if (skill.isNotEmpty) {
                                setState(() {
                                  widget.members[index].memberSkills.add(skill);
                                  widget.members[index].memberSkillsController
                                      .clear();
                                });
                              }
                            },
                            style: IconButton.styleFrom(
                              backgroundColor: isLightMode
                                  ? AppColors.purple.withAlpha(30)
                                  : AppColors.blue.withAlpha(80),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                            icon: Icon(
                              Icons.add,
                              color: isLightMode
                                  ? AppColors.purple
                                  : AppColors.blue,
                              size: 28.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),
                      SkillWidget(skills: widget.members[index].memberSkills),
                    ],
                  ),
                ),
                Positioned(
                  top: -10.h,
                  child: CircleAvatar(
                    radius: 16.r,
                    backgroundColor: isLightMode
                        ? AppColors.purple.withAlpha(40)
                        : AppColors.blue.withAlpha(80),
                    child: Text(
                      widget.members[index].id.toString(),
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: isLightMode ? AppColors.purple : AppColors.blue,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: -4.h,
                  right: isArabic ? 0 : -330.w,
                  left: isArabic ? -330.w : 0,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        currentMember--;
                        widget.members[index].memberSkills.clear();
                        widget.members.removeAt(index);
                      });
                    },
                    icon: Icon(
                      Icons.delete,
                      color: isLightMode
                          ? AppColors.black.withAlpha(80)
                          : AppColors.primary.withAlpha(80),
                      size: 28.sp,
                    ),
                  ),
                ),
              ],
            );
          },
          separatorBuilder: (_, __) => SizedBox(height: 24.h),
          itemCount: widget.members.length,
        ),
        SizedBox(height: size.height * 0.03),
        GestureDetector(
          onTap: () {
            setState(() {
              currentMember++;
              members.add(MemberModel(
                id: currentMember,
                memberNameController: TextEditingController(),
                memberName: '',
                memberSkillsController: TextEditingController(),
                memberSkills: [],
              ));
            });
          },
          child: Container(
            width: isArabic ? size.width * 0.4 : size.width * 0.5,
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: isLightMode
                  ? AppColors.purple.withAlpha(20)
                  : AppColors.blue.withAlpha(20),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.add,
                  color: isLightMode ? AppColors.purple : AppColors.blue,
                ),
                SizedBox(width: 6.w),
                Text(
                  S.of(context).team_page_view_title3,
                  style: TextStyle(
                    fontSize: isArabic ? 15.sp : 14.sp,
                    color: isLightMode ? AppColors.purple : AppColors.blue,
                    fontWeight: isArabic ? FontWeight.w700 : FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class SkillWidget extends StatefulWidget {
  final List<String> skills;
  const SkillWidget({super.key, required this.skills});

  @override
  State<SkillWidget> createState() => _SkillWidgetState();
}

class _SkillWidgetState extends State<SkillWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12.w,
        mainAxisSpacing: 8.h,
        mainAxisExtent: size.height * 0.06,
      ),
      itemCount: widget.skills.length,
      itemBuilder: (context, index) {
        return Stack(
          children: [
            Container(
              width: size.width * 0.3,
              padding: EdgeInsets.all(12.h),
              decoration: BoxDecoration(
                color: AppColors.blue.withAlpha(50),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Text(
                textDirection: TextDirection.ltr,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                widget.skills[index],
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: isLightMode
                      ? AppColors.blue
                      : AppColors.primary.withAlpha(220),
                ),
              ),
            ),
            Positioned(
              top: -15.h,
              right: -14.w,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    widget.skills.removeAt(index);
                  });
                },
                icon: Icon(
                  Icons.close,
                  size: 16.sp,
                  color: isLightMode
                      ? AppColors.blue
                      : AppColors.primary.withAlpha(220),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
