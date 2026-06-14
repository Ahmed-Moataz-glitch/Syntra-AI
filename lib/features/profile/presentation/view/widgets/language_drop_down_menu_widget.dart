import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syntra_ai/core/utils/app_colors.dart';
import 'package:syntra_ai/core/view_model/language_cubit/language_cubit.dart';
import 'package:syntra_ai/generated/l10n.dart';

class LanguageDropDownMenuWidget extends StatefulWidget {
  final List<DropdownMenuItem<String>> items;
  const LanguageDropDownMenuWidget({super.key, required this.items});

  @override
  State<LanguageDropDownMenuWidget> createState() =>
      _LanguageDropDownMenuWidgetState();
}

class _LanguageDropDownMenuWidgetState
    extends State<LanguageDropDownMenuWidget> {
  late String selectedLanguage;
  @override
  Widget build(BuildContext context) {
    selectedLanguage = switch(LanguageCubit.get(context).currentLanguage){
      LanguageModeState.arabic => 'arabic',
      LanguageModeState.english => 'english',
    };
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    return Row(
      children: [
        Text(
          S.of(context).language,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: 18.sp,
                color: !isLightMode
                    ? AppColors.primary
                    : AppColors.black.withAlpha(200),
                fontWeight: FontWeight.w600,
              ),
        ),
        const Spacer(),
        DropdownButton(
          value: selectedLanguage,
          items: widget.items,
          onChanged: (value) {
            setState(() {
              selectedLanguage = value!;
            });
          },
        ),
      ],
    );
  }
}
