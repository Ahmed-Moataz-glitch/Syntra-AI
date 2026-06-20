// ignore_for_file: use_build_context_synchronously

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:syntra_ai/core/utils/app_assets.dart';
import 'package:syntra_ai/core/utils/app_colors.dart';
import 'package:syntra_ai/core/utils/app_dialogs.dart';
import 'package:syntra_ai/core/utils/app_toast.dart';
import 'package:syntra_ai/core/view/widgets/logo_widget.dart';
import 'package:syntra_ai/core/view/widgets/secondary_gradient_button_widget.dart';
import 'package:syntra_ai/features/community/data/api/community_api.dart';
import 'package:syntra_ai/features/community/data/repo/data_source/community_data_source_impl.dart';
import 'package:syntra_ai/features/community/data/repo/repo/community_repo_impl.dart';
import 'package:syntra_ai/features/community/domain/repo/data_source/community_data_source.dart';
import 'package:syntra_ai/features/community/domain/repo/repo/community_repo.dart';
import 'package:syntra_ai/features/community/domain/use_case/end_interview_use_case.dart';
import 'package:syntra_ai/features/community/domain/use_case/get_interview_session_status_use_case.dart';
import 'package:syntra_ai/features/community/domain/use_case/get_languages_use_case.dart';
import 'package:syntra_ai/features/community/domain/use_case/get_tracks_use_case.dart';
import 'package:syntra_ai/features/community/domain/use_case/get_users_finished_tracks_use_case.dart';
import 'package:syntra_ai/features/community/domain/use_case/interview_chat_use_case.dart';
import 'package:syntra_ai/features/community/domain/use_case/process_audio_use_case.dart';
import 'package:syntra_ai/features/community/domain/use_case/start_interview_use_case.dart';
import 'package:syntra_ai/features/community/domain/use_case/text_to_audio_use_case.dart';
import 'package:syntra_ai/features/community/presentation/view/widgets/completed_tracks_widget.dart';
import 'package:syntra_ai/features/community/presentation/view/widgets/modal_bottom_sheet_widget.dart';
import 'package:syntra_ai/features/community/presentation/view/widgets/verified_skills_widget.dart';
import 'package:syntra_ai/features/community/presentation/view_model/community_cubit.dart';
import 'package:syntra_ai/generated/l10n.dart';
import 'package:toastification/toastification.dart';

class CommunityPageForRecruiter extends StatefulWidget {
  const CommunityPageForRecruiter({super.key});

  @override
  State<CommunityPageForRecruiter> createState() =>
      _CommunityPageForRecruiterState();
}

class _CommunityPageForRecruiterState extends State<CommunityPageForRecruiter> {
  late final CommunityCubit communityCubit;
  bool isInviteSent = false;

  @override
  void initState() {
    super.initState();
    CommunityApi communityApi = CommunityApi();
    CommunityDataSource communityDataSource =
        CommunityDataSourceImpl(communityApi);
    CommunityRepo communityRepo = CommunityRepoImpl(communityDataSource);
    GetUsersFinishedTracksUseCase getUsersFinishedTracksUseCase =
        GetUsersFinishedTracksUseCase(communityRepo);
    GetTracksUseCase getTracksUseCase = GetTracksUseCase(communityRepo);
    GetLanguagesUseCase getLanguagesUseCase =
        GetLanguagesUseCase(communityRepo);
    StartInterviewUseCase startInterviewUseCase =
        StartInterviewUseCase(communityRepo);
    InterviewChatUseCase interviewChatUseCase =
        InterviewChatUseCase(communityRepo);
    GetInterviewSessionStatusUseCase getInterviewSessionStatusUseCase =
        GetInterviewSessionStatusUseCase(communityRepo);
    EndInterviewUseCase endInterviewUseCase =
        EndInterviewUseCase(communityRepo);
    TextToAudioUseCase textToAudioUseCase = TextToAudioUseCase(communityRepo);
    ProcessAudioUseCase processAudioUseCase =
        ProcessAudioUseCase(communityRepo);
    communityCubit = CommunityCubit(
      getUsersFinishedTracksUseCase: getUsersFinishedTracksUseCase,
      getTracksUseCase: getTracksUseCase,
      getLanguagesUseCase: getLanguagesUseCase,
      startInterviewUseCase: startInterviewUseCase,
      interviewChatUseCase: interviewChatUseCase,
      getInterviewSessionStatusUseCase: getInterviewSessionStatusUseCase,
      endInterviewUseCase: endInterviewUseCase,
      textToAudioUseCase: textToAudioUseCase,
      processAudioUseCase: processAudioUseCase,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await communityCubit.getUsersFinishedTracks();
    });
  }

  @override
  void dispose() {
    communityCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          width: size.width * 0.445,
          height: size.height * 0.07,
          child: const LogoWidget(),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.transparent,
      ),
      body: BlocConsumer<CommunityCubit, CommunityState>(
        bloc: communityCubit,
        listenWhen: (previous, current) =>
            current is GetUsersFinishedTracksLoading ||
            current is GetUsersFinishedTracksSuccess ||
            current is GetUsersFinishedTracksError,
        buildWhen: (previous, current) =>
            current is GetUsersFinishedTracksSuccess,
        listener: (context, state) {
          if (state is GetUsersFinishedTracksLoading) {
            AppDialogs.showLoadingDialog(
              context,
              title: 'Loading completed learners...',
            );
          }
          if (state is GetUsersFinishedTracksSuccess) {
            Navigator.of(context, rootNavigator: true).pop();
          }
          if (state is GetUsersFinishedTracksError) {
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
          if (state is GetUsersFinishedTracksSuccess) {
            final usersFinishedTracks =
                state.getUsersFinishedTracksResponseEntity.users;
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: size.width * 0.44,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.r, vertical: 8.r),
                        decoration: BoxDecoration(
                          color: isLightMode
                              ? AppColors.purple.withAlpha(20)
                              : AppColors.blue.withAlpha(30),
                          borderRadius: BorderRadius.circular(24.r),
                        ),
                        child: Row(
                          spacing: 8.w,
                          children: [
                            Icon(
                              Icons.corporate_fare_outlined,
                              color: isLightMode
                                  ? AppColors.purple
                                  : AppColors.blue,
                              size: 18.sp,
                            ),
                            Text(
                              'RECRUITER HUB',
                              style: TextStyle(
                                color: isLightMode
                                    ? AppColors.purple
                                    : AppColors.blue,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.01),
                    Text(
                      'Completed track talent',
                      style: TextStyle(
                        color:
                            isLightMode ? AppColors.black : AppColors.primary,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: size.height * 0.01),
                    Text(
                      'Browse learners who finished their roadmaps - with verified skills pulled from their profiles.',
                      style: TextStyle(
                        color: isLightMode
                            ? AppColors.black.withAlpha(150)
                            : AppColors.primary.withAlpha(150),
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: usersFinishedTracks.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: size.height * 0.04),
                      itemBuilder: (context, index) {
                        final user = usersFinishedTracks[index];
                        return Container(
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(
                              color: AppColors.secondary.withAlpha(150),
                              width: 0.5.r,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.black.withAlpha(20),
                                blurRadius: 4.r,
                                offset: Offset(1, 1),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.all(12.r),
                                decoration: BoxDecoration(
                                  color: AppColors.purple.withAlpha(20),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12.r),
                                    topRight: Radius.circular(12.r),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    usersFinishedTracks[index].avatar.isNotEmpty
                                        ? Container(
                                            decoration: BoxDecoration(
                                              color: AppColors.transparent,
                                              shape: BoxShape.circle,
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadiusGeometry.circular(
                                                      16.r),
                                              child: CachedNetworkImage(
                                                width: 72.w,
                                                height: 72.h,
                                                imageUrl:
                                                    usersFinishedTracks[index]
                                                        .avatar,
                                                fit: BoxFit.fill,
                                                placeholder: (context, title) {
                                                  return Lottie.asset(
                                                    AppAssets.loadingLottie,
                                                    fit: BoxFit.fill,
                                                  );
                                                },
                                              ),
                                            ),
                                          )
                                        : Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 16.r,
                                              vertical: 8.r,
                                            ),
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  AppColors.blue,
                                                  AppColors.purple,
                                                ],
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.r),
                                            ),
                                            child: Text(
                                              user.name[0].toUpperCase(),
                                              style: TextStyle(
                                                color: AppColors.primary,
                                                fontSize: 24.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                    SizedBox(width: 12.w),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          user.name,
                                          style: TextStyle(
                                            color: AppColors.black,
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Row(
                                          spacing: 6.w,
                                          children: [
                                            SvgPicture.asset(
                                              AppAssets.emailIcon,
                                              width: 16.w,
                                              height: 16.h,
                                              colorFilter: ColorFilter.mode(
                                                AppColors.black.withAlpha(150),
                                                BlendMode.srcIn,
                                              ),
                                            ),
                                            Text(
                                              user.email,
                                              style: TextStyle(
                                                color: AppColors.black
                                                    .withAlpha(150),
                                                fontSize: 14.sp,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          'Finished ${user.updatedAt}',
                                          style: TextStyle(
                                            color:
                                                AppColors.black.withAlpha(150),
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                        SizedBox(height: 4.h),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 6.r,
                                            vertical: 2.r,
                                          ),
                                          decoration: BoxDecoration(
                                            color:
                                                AppColors.purple.withAlpha(30),
                                            borderRadius:
                                                BorderRadius.circular(4.r),
                                          ),
                                          child: Text(
                                            user.skills.length > 1
                                                ? '${user.skills.length} skills'
                                                : '${user.skills.length} skill',
                                            style: TextStyle(
                                              color: AppColors.purple,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12.sp,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    // Container(
                                    //   padding: EdgeInsets.symmetric(
                                    //     horizontal: 6.r,
                                    //     vertical: 4.r,
                                    //   ),
                                    //   decoration: BoxDecoration(
                                    //     color: AppColors.green.withAlpha(30),
                                    //     borderRadius:
                                    //         BorderRadius.circular(4.r),
                                    //   ),
                                    //   child: Row(
                                    //     spacing: 4.w,
                                    //     children: [
                                    //       Icon(
                                    //         Icons.verified_outlined,
                                    //         color: const Color.fromARGB(
                                    //             255, 21, 185, 21),
                                    //         size: 16.sp,
                                    //       ),
                                    //       Text(
                                    //         'Verified',
                                    //         style: TextStyle(
                                    //           color: const Color.fromARGB(
                                    //               255, 21, 185, 21),
                                    //           fontSize: 12.sp,
                                    //           fontWeight: FontWeight.w600,
                                    //         ),
                                    //       ),
                                    //     ],
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(16.r),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'COMPLETED TRACKS',
                                      style: TextStyle(
                                        color: const Color.fromARGB(
                                            255, 59, 207, 59),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    SizedBox(height: 8.h),
                                    CompletedTracksWidget(
                                      finishedTracks: user.finishedTracks,
                                    ),
                                    SizedBox(height: 16.h),
                                    Text(
                                      'VERIFIED SKILLS',
                                      style: TextStyle(
                                        color:
                                            AppColors.secondary.withAlpha(150),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    SizedBox(height: 8.h),
                                    VerifiedSkillsWidget(
                                      skills: user.skills,
                                    ),
                                    SizedBox(height: 24.h),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: SecondaryGradientButtonWidget(
                                            title: isInviteSent
                                                ? 'Invite Sent'
                                                : 'Send mock interview invite',
                                            icon: Icons.videocam_outlined,
                                            onPressed: () async {
                                              await communityCubit.getTracks();
                                              AppDialogs.showbottomSheet(
                                                context,
                                                child: ModalBottomSheetWidget(
                                                  user: user,
                                                  communityCubit:
                                                      communityCubit,
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 12.h),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
