import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syntra_ai/core/utils/app_colors.dart';
import 'package:syntra_ai/core/utils/app_routes.dart';
import 'package:syntra_ai/core/view/widgets/gradient_button_widget.dart';
import 'package:syntra_ai/features/auth/presentation/view/widgets/text_form_field_widget.dart';
import 'package:syntra_ai/features/auth/presentation/view/widgets/validator.dart';
import 'package:syntra_ai/features/learn/presentation/view_model/learn_cubit.dart';
import 'package:syntra_ai/generated/l10n.dart';

class RowWidget extends StatefulWidget {
  final LearnCubit learnCubit;
  final String text;
  const RowWidget({super.key, required this.learnCubit, required this.text});

  @override
  State<RowWidget> createState() => _RowWidgetState();
}

class _RowWidgetState extends State<RowWidget> {
  late final TextEditingController trackController;
  bool isClicked = false;

  @override
  void initState() {
    super.initState();
    trackController = TextEditingController();
  }

  @override
  void dispose() {
    trackController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    return !isClicked
        ? InkWell(
            splashFactory: NoSplash.splashFactory,
            onTap: () {
              setState(() {
                isClicked = true;
              });
            },
            child: isLightMode
                ? Row(
                    spacing: 8.w,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.text,
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: AppColors.purple,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        size: 16.sp,
                        color: AppColors.purple,
                      ),
                    ],
                  )
                : Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withAlpha(240),
                      border: Border.all(
                          color: AppColors.dividerColor, width: 1.4.r),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Row(
                      spacing: 8.w,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.text,
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: AppColors.purple,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          size: 16.sp,
                          color: AppColors.purple,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                  ),
          )
        : Column(
            spacing: 12.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).learn_page_title6,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: isLightMode
                      ? AppColors.secondary
                      : AppColors.primary.withAlpha(220),
                ),
              ),
              Row(
                spacing: 16.w,
                children: [
                  Expanded(
                    flex: 4,
                    child: SizedBox(
                      height: 45.h,
                      child: TextFormFieldWidget(
                        controller: trackController,
                        validator: Validator.validateName,
                        hintText: 'e.g. Cybersecurity, ML, Backend',
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: 45.h,
                      child: GradientButtonWidget(
                        title: S.of(context).learn_page_button2,
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                            AppRoutes.suggestedTrack,
                            arguments: {
                              'learnCubit': widget.learnCubit,
                              'suggestedTrack': trackController.text.trim(),
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
  }
}
