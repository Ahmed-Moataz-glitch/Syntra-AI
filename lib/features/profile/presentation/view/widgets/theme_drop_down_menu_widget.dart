import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syntra_ai/core/utils/app_colors.dart';
import 'package:syntra_ai/generated/l10n.dart';

class ThemeDropDownMenuWidget extends StatefulWidget {
  final List<DropdownMenuItem<String>> items;
  const ThemeDropDownMenuWidget({super.key, required this.items});

  @override
  State<ThemeDropDownMenuWidget> createState() => _ThemeDropDownMenuWidgetState();
}

class _ThemeDropDownMenuWidgetState extends State<ThemeDropDownMenuWidget> {
  String selectedThemeMode = 'light';
  @override
  Widget build(BuildContext context) {
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    return Row(
      children: [
        Text(
          S.of(context).theme_mode,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontSize: 18.sp,
            color: !isLightMode ? AppColors.primary : AppColors.black.withAlpha(200),
            fontWeight: FontWeight.w600,
          ),
        ),
        const Spacer(),
        DropdownButton(
          // hint: Text('light'),
          value: selectedThemeMode,
          items: widget.items,
          onChanged: (value) {
            setState(() {
              selectedThemeMode = value!;
            });
          },
        ),
      ],
    );
  }
}
