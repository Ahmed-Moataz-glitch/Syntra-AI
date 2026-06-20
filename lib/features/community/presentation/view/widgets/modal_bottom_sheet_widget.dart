import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syntra_ai/core/utils/app_colors.dart';
import 'package:syntra_ai/core/utils/app_dialogs.dart';
import 'package:syntra_ai/core/utils/app_toast.dart';
import 'package:syntra_ai/core/view/widgets/secondary_gradient_button_widget.dart';
import 'package:syntra_ai/features/community/domain/entities/get_users_finished_tracks_response_entity.dart';
import 'package:syntra_ai/features/community/presentation/view/widgets/invitation_success_widget.dart';
import 'package:syntra_ai/features/community/presentation/view_model/community_cubit.dart';
import 'package:syntra_ai/generated/l10n.dart';
import 'package:toastification/toastification.dart';

class ModalBottomSheetWidget extends StatefulWidget {
  final UsersFinishedTracksEntity user;
  final CommunityCubit communityCubit;
  const ModalBottomSheetWidget({super.key, required this.user, required this.communityCubit});

  @override
  State<ModalBottomSheetWidget> createState() => _ModalBottomSheetWidgetState();
}

class _ModalBottomSheetWidgetState extends State<ModalBottomSheetWidget> {
  String selectedTrack = '';
  
  @override
  Widget build(BuildContext context) {
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    return Container(
      height: 400.h,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          spacing: 4.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: double.infinity),
            Text(
              'SEND INVITE',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.purple,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              widget.user.name,
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.black,
              ),
            ),
            Text(
              widget.user.email,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.secondary.withAlpha(200),
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'INTERVIEW TRACK',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.secondary.withAlpha(200),
              ),
            ),
            BlocConsumer<CommunityCubit, CommunityState>(
              bloc: widget.communityCubit,
              listenWhen: (previous, current) =>
                  current is GetTracksLoading ||
                  current is GetTracksSuccess ||
                  current is GetTracksError,
              buildWhen: (previous, current) => current is GetTracksSuccess,
              listener: (context, state) {
                if (state is GetTracksLoading) {
                  AppDialogs.showLoadingDialog(
                    context,
                    title: 'Loading tracks...',
                  );
                }
                if (state is GetTracksSuccess) {
                  Navigator.of(context, rootNavigator: true).pop();
                }
                if (state is GetTracksError) {
                  Navigator.of(context, rootNavigator: true).pop();
                  AppToast.showToast(
                    context: context,
                    title: S.of(context).app_toast_error,
                    description: state.message,
                    type: ToastificationType.error,
                  );
                }
              },
              builder: (context, state) {
                if (state is GetTracksSuccess) {
                  return DropdownButton(
                    isExpanded: true,
                    padding: EdgeInsets.all(4.r),
                    value: selectedTrack == ''
                        ? state.getTracksResponseEntity.tracks.first.labelEn
                        : selectedTrack,
                    items: state.getTracksResponseEntity.tracks
                        .map(
                          (track) => DropdownMenuItem(
                            value: track.labelEn,
                            child: Text(
                              track.labelEn,
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: isLightMode
                                    ? AppColors.black
                                    : AppColors.blue,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedTrack = value!;
                      });
                    },
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Completed: ',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.secondary.withAlpha(200),
                  ),
                ),
                Expanded(
                  child: Text(
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    widget.user.finishedTracks
                        .toString()
                        .replaceFirstMapped('[', (match) => '')
                        .replaceFirstMapped(']', (match) => ''),
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.secondary.withAlpha(200),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Row(
              spacing: 24.w,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SecondaryGradientButtonWidget(
                    title: 'Cancel',
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop();
                    },
                  ),
                ),
                Expanded(
                  child: SecondaryGradientButtonWidget(
                    title: 'Send Invite',
                    icon: Icons.send,
                    onPressed: () {
                      AppDialogs.showbottomSheet(
                        context,
                        child: InvitationSuccessWidget(
                          name: widget.user.name,
                          selectedTrack: selectedTrack,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
