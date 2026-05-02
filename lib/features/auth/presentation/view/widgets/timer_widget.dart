import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syntra_ai/core/utils/app_localization.dart';
import 'package:syntra_ai/generated/l10n.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({super.key});

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  int secondsRemaining = 59;
  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if(secondsRemaining == 0) {
        timer.cancel();
      } else {
        setState(() {
          secondsRemaining--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        secondsRemaining == 0
        ? const SizedBox.shrink()
        : Text.rich(
          TextSpan(
            text: AppLocalization.isArabic() ? '${S.of(context).timer_title} ' : S.of(context).timer_title,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: 16.sp,
            ),
            // style: TextStyle(fontSize: 16.sp, color: AppColors.black, fontWeight: FontWeight.w400),
            children: [
              TextSpan(
                text: secondsRemaining < 10 ? '00:0$secondsRemaining' : '00:$secondsRemaining',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 16.sp,
                ),
                // style: TextStyle(fontSize: 16.sp, color: AppColors.blue, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
