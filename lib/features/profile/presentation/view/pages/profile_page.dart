import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:syntra_ai/core/utils/app_assets.dart';
import 'package:syntra_ai/core/utils/app_colors.dart';
import 'package:syntra_ai/core/utils/app_dialogs.dart';
import 'package:syntra_ai/core/utils/app_localization.dart';
import 'package:syntra_ai/core/utils/app_routes.dart';
import 'package:syntra_ai/core/utils/app_toast.dart';
import 'package:syntra_ai/core/utils/shared_preferences.dart';
import 'package:syntra_ai/core/view/widgets/logo_widget.dart';
import 'package:syntra_ai/core/view/widgets/secondary_gradient_button_widget.dart';
import 'package:syntra_ai/core/view_model/language_cubit/language_cubit.dart';
import 'package:syntra_ai/core/view_model/theme_cubit/theme_cubit.dart';
import 'package:syntra_ai/features/profile/data/api/profile_api.dart';
import 'package:syntra_ai/features/profile/data/repo/data_source/profile_data_source_impl.dart';
import 'package:syntra_ai/features/profile/data/repo/repo/profile_repo_impl.dart';
import 'package:syntra_ai/features/profile/domain/entities/user_data_response_entity.dart';
import 'package:syntra_ai/features/profile/domain/repo/data_source/profile_data_source.dart';
import 'package:syntra_ai/features/profile/domain/repo/repo/profile_repo.dart';
import 'package:syntra_ai/features/profile/domain/use_case/delete_user_profile_use_case.dart';
import 'package:syntra_ai/features/profile/domain/use_case/fetch_user_data_use_case.dart';
import 'package:syntra_ai/features/profile/domain/use_case/get_user_profile_use_case.dart';
import 'package:syntra_ai/features/profile/domain/use_case/logout_use_case.dart';
import 'package:syntra_ai/features/profile/domain/use_case/pick_user_profile_image_use_case.dart';
import 'package:syntra_ai/features/profile/domain/use_case/upload_user_profile_image_use_case.dart';
import 'package:syntra_ai/features/profile/presentation/view/widgets/finished_skills_widget.dart';
import 'package:syntra_ai/features/profile/presentation/view/widgets/finished_tracks_widget.dart';
import 'package:syntra_ai/features/profile/presentation/view/widgets/language_drop_down_menu_widget.dart';
import 'package:syntra_ai/features/profile/presentation/view/widgets/theme_drop_down_menu_widget.dart';
import 'package:syntra_ai/features/profile/presentation/view/widgets/user_item_widget.dart';
import 'package:syntra_ai/features/profile/presentation/view_model/profile_cubit.dart';
import 'package:syntra_ai/generated/l10n.dart';
import 'package:toastification/toastification.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late ProfileCubit profileCubit;
  bool isDarkMode = false;
  late final String userId;

  @override
  void initState() {
    super.initState();
    ProfileApi profileApi = ProfileApi();
    ProfileDataSource profileDataSource = ProfileDataSourceImpl(profileApi);
    ProfileRepo profileRepo = ProfileRepoImpl(profileDataSource);
    FetchUserDataUseCase fetchUserDataUseCase = FetchUserDataUseCase(
      profileRepo,
    );
    GetUserProfileUseCase getUserProfileUseCase = GetUserProfileUseCase(
      profileRepo,
    );
    DeleteUserProfileUseCase deleteUserProfileUseCase =
        DeleteUserProfileUseCase(profileRepo);
    PickUserProfileImageUseCase pickUserProfileImageUseCase =
        PickUserProfileImageUseCase(profileRepo);
    UploadUserProfileImageUseCase uploadUserProfileImageUseCase =
        UploadUserProfileImageUseCase(profileRepo);
    LogoutUseCase logoutUseCase = LogoutUseCase(profileRepo);
    profileCubit = ProfileCubit(
      fetchUserDataUseCase: fetchUserDataUseCase,
      pickUserProfileImageUseCase: pickUserProfileImageUseCase,
      uploadUserProfileImageUseCase: uploadUserProfileImageUseCase,
      logoutUseCase: logoutUseCase,
      getUserProfileUseCase: getUserProfileUseCase,
      deleteUserProfileUseCase: deleteUserProfileUseCase,
    );
    final userProfile = profileCubit.userProfile;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      userId = await FlutterSharedPreferences.instance.getStudentId();
      userProfile != null
          ? profileCubit.getUserProfile(userProfile.id)
          : await profileCubit.fetchUserData();
    });
  }

  @override
  void dispose() {
    profileCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    bool isLoading = true;
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: AppColors.transparent,
              shadowColor: AppColors.purple.withAlpha(35),
              floating: true,
              scrolledUnderElevation: 16,
              leadingWidth: size.width * 0.445,
              actionsPadding: EdgeInsets.only(right: size.width * 0.03),
              leading: const LogoWidget(),
              actions: [
                BlocListener<ProfileCubit, ProfileState>(
                  bloc: profileCubit,
                  listenWhen: (previous, current) =>
                      current is LogoutLoading ||
                      current is LogoutSuccess ||
                      current is LogoutError,
                  listener: (context, state) {
                    if (state is LogoutLoading) {
                      AppDialogs.showLoadingDialog(
                        context,
                        title: S.of(context).loading_dialog_logout,
                      );
                    } else {
                      Navigator.of(context, rootNavigator: true).pop();
                    }
                    if (state is LogoutSuccess) {
                      Navigator.of(context, rootNavigator: true)
                          .pushNamedAndRemoveUntil(
                        AppRoutes.login,
                        (route) => false,
                      );
                    } else if (state is LogoutError) {
                      AppToast.showToast(
                        context: context,
                        title: S.of(context).app_toast_error,
                        description: state.message,
                        type: ToastificationType.error,
                      );
                    }
                  },
                  child: InkWell(
                    onTap: () async {
                      await profileCubit.logout(userId);
                    },
                    splashFactory: NoSplash.splashFactory,
                    child: Container(
                      margin: AppLocalization.isArabic()
                          ? EdgeInsets.only(left: 12.w, top: 10.h, bottom: 6.h)
                          : EdgeInsets.zero,
                      padding: AppLocalization.isArabic()
                          ? EdgeInsets.only(
                              right: 16.w,
                              top: 2.h,
                              bottom: 2.h,
                            )
                          : EdgeInsets.only(
                              left: 16.w,
                              top: 2.h,
                              bottom: 2.h,
                            ),
                      decoration: BoxDecoration(
                        color: isLightMode
                            ? AppColors.gray.withAlpha(60)
                            : AppColors.primary,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Row(
                        spacing: 8.w,
                        children: [
                          Text(
                            S.of(context).profile_page_button1,
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.red,
                                ),
                          ),
                          SvgPicture.asset(
                            AppAssets.signinIcon,
                            colorFilter: ColorFilter.mode(
                              AppColors.red,
                              BlendMode.srcIn,
                            ),
                          ),
                          SizedBox(width: size.width * 0.01),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
              expandedHeight: size.height * 0.06,
              pinned: true,
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: size.height * 0.15,
                          child: VerticalDivider(
                            color: AppColors.purple,
                            thickness: 5,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            spacing: size.height * 0.006,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                S.of(context).profile_page_title1,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w600,
                                      color:
                                          isLightMode ? null : AppColors.blue,
                                    ),
                              ),
                              Text(
                                S.of(context).profile_page_title2,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(
                                      fontSize: 28.sp,
                                      color: isLightMode
                                          ? null
                                          : AppColors.primary.withAlpha(240),
                                      fontWeight: FontWeight.w700,
                                    ),
                              ),
                              Text(
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                S.of(context).profile_page_title3,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      color: isLightMode
                                          ? null
                                          : AppColors.primary.withAlpha(170),
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.04),
                    LanguageDropDownMenuWidget(
                      items: [
                        DropdownMenuItem(
                          value: 'english',
                          child: Text(
                            S.of(context).english,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: AppColors.blue,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          onTap: () async {
                            await LanguageCubit.get(context)
                                .selectLanguage(LanguageModeState.english);
                          },
                        ),
                        DropdownMenuItem(
                          value: 'arabic',
                          child: Text(
                            S.of(context).arabic,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: AppColors.blue,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          onTap: () async {
                            await LanguageCubit.get(context)
                                .selectLanguage(LanguageModeState.arabic);
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.04),
                    ThemeDropDownMenuWidget(
                      items: [
                        DropdownMenuItem(
                          value: 'light',
                          child: Text(
                            S.of(context).light_mode,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: AppColors.blue,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          onTap: () async {
                            await ThemeCubit.get(context)
                                .selectTheme(ThemeModeState.light);
                          },
                        ),
                        DropdownMenuItem(
                          value: 'dark',
                          child: Text(
                            S.of(context).dark_mode,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: AppColors.blue,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          onTap: () async {
                            await ThemeCubit.get(context)
                                .selectTheme(ThemeModeState.dark);
                          },
                        ),
                        DropdownMenuItem(
                          value: 'system',
                          child: Text(
                            S.of(context).system_mode,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: AppColors.blue,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          onTap: () async {
                            await ThemeCubit.get(context)
                                .selectTheme(ThemeModeState.system);
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.04),
                    Container(
                      width: size.width * 0.9,
                      // height: size.height * 0.6,
                      decoration: BoxDecoration(
                        color: isLightMode
                            ? Theme.of(context)
                                .scaffoldBackgroundColor
                                .withAlpha(200)
                            : Theme.of(context).primaryColorDark.withAlpha(60),
                        borderRadius: BorderRadius.circular(16.r),
                        border: !isLightMode
                            ? null
                            : Border.all(
                                color: AppColors.dividerColor.withAlpha(200),
                                width: 0.4,
                              ),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            height: size.height * 0.15,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? [
                                        AppColors.gradientColor1,
                                        AppColors.purple.withAlpha(120),
                                      ]
                                    : [
                                        AppColors.blue.withAlpha(150),
                                        AppColors.purple.withAlpha(150),
                                        // AppColors.red.withAlpha(150),
                                      ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16.r),
                                topRight: Radius.circular(16.r),
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              SizedBox(height: size.height * 0.04),
                              BlocConsumer<ProfileCubit, ProfileState>(
                                bloc: profileCubit,
                                listenWhen: (previous, current) =>
                                    current is PickUserProfileImageError,
                                listener: (context, state) {
                                  if (state is PickUserProfileImageError) {
                                    AppToast.showToast(
                                      context: context,
                                      title: S.of(context).app_toast_error,
                                      description: state.message,
                                      type: ToastificationType.error,
                                    );
                                  }
                                },
                                builder: (context, state) {
                                  final pickedUserProfileImage =
                                      profileCubit.pickedUserProfileImage;
                                  final userProfileImage =
                                      profileCubit.userProfileImage;
                                  return Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100.r),
                                        child: Container(
                                          width: size.width * 0.4,
                                          height: size.width * 0.4,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColors
                                                .scaffoldBackgroundColor,
                                            // .withAlpha(150),
                                          ),
                                          child: pickedUserProfileImage != null
                                              ? Image.file(
                                                  File(pickedUserProfileImage),
                                                  fit: BoxFit.fill,
                                                )
                                              : userProfileImage != null &&
                                                      userProfileImage
                                                          .isNotEmpty
                                                  ? CachedNetworkImage(
                                                      imageUrl:
                                                          userProfileImage,
                                                      fit: BoxFit.fill,
                                                      placeholder:
                                                          (context, title) {
                                                        return Lottie.asset(
                                                          AppAssets
                                                              .loadingLottie,
                                                          fit: BoxFit.fill,
                                                        );
                                                      },
                                                    )
                                                  : Image.asset(
                                                      AppAssets
                                                          .defaultUserProfileImage,
                                                      fit: BoxFit.fill,
                                                    ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 8,
                                        right: 2,
                                        child: CircleAvatar(
                                          radius: size.width * 0.06,
                                          backgroundColor: AppColors.blue,
                                          child: IconButton(
                                            onPressed: () async {
                                              await profileCubit
                                                  .pickUserProfileImage();
                                            },
                                            icon: Icon(
                                              Icons.camera_alt_outlined,
                                              color: AppColors.fillColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                              SizedBox(height: size.height * 0.015),
                              BlocConsumer<ProfileCubit, ProfileState>(
                                bloc: profileCubit,
                                listenWhen: (previous, current) =>
                                    current is ProfileError,
                                buildWhen: (previous, current) =>
                                    current is ProfileLoading ||
                                    current is ProfileLoaded ||
                                    current is GetUserProfileSuccess,
                                listener: (context, state) {
                                  if (state is ProfileError) {
                                    AppToast.showToast(
                                      context: context,
                                      title: S.of(context).app_toast_error,
                                      description: state.message,
                                      type: ToastificationType.error,
                                    );
                                  }
                                },
                                builder: (context, state) {
                                  if (state is ProfileLoading) {
                                    isLoading = true;
                                    return Skeletonizer(
                                      enabled: isLoading,
                                      containersColor:
                                          AppColors.dividerColor.withAlpha(50),
                                      ignoreContainers: false,
                                      child: UserItemWidget(
                                        user: UserDataEntity(
                                          id: '',
                                          name: '',
                                          email: '',
                                          role: '',
                                          githubId: '',
                                          emailVerified: false,
                                          isActive: false,
                                          createdAt: '',
                                          updatedAt: '',
                                        ),
                                      ),
                                    );
                                  }
                                  if (state is ProfileLoaded) {
                                    // userDataResponseEntity =
                                    //     state.userDataResponseEntity;
                                    isLoading = false;
                                    return Skeletonizer(
                                      enabled: isLoading,
                                      child: UserItemWidget(
                                        user: state.userDataResponseEntity.user,
                                      ),
                                    );
                                  }
                                  if (state is GetUserProfileSuccess) {
                                    // userDataResponseEntity =
                                    //     UserDataResponseEntity(
                                    //   user: UserDataEntity(
                                    //     id: state.userProfileModel!.id,
                                    //     name: state.userProfileModel!.name,
                                    //     email: state.userProfileModel!.email,
                                    //     role: state.userProfileModel!.role,
                                    //     githubId:
                                    //         state.userProfileModel!.githubId,
                                    //     emailVerified: state
                                    //         .userProfileModel!.emailVerified,
                                    //     isActive:
                                    //         state.userProfileModel!.isActive,
                                    //     skills: state.userProfileModel!.skills,
                                    //     finishedTracks: state
                                    //         .userProfileModel!.finishedTracks,
                                    //     trackFinished: state
                                    //         .userProfileModel!.trackFinished,
                                    //     createdAt:
                                    //         state.userProfileModel!.createdAt,
                                    //     updatedAt:
                                    //         state.userProfileModel!.updatedAt,
                                    //   ),
                                    // );
                                    final userProfile = state.userProfileModel;
                                    return UserItemWidget(
                                      user: UserDataEntity(
                                        id: userProfile!.id,
                                        name: userProfile.name,
                                        email: userProfile.email,
                                        role: userProfile.role,
                                        githubId: userProfile.githubId,
                                        emailVerified:
                                            userProfile.emailVerified,
                                        isActive: userProfile.isActive,
                                        createdAt: userProfile.createdAt,
                                        updatedAt: userProfile.updatedAt,
                                      ),
                                    );
                                  } else {
                                    return const SizedBox.shrink();
                                  }
                                },
                              ),
                              SizedBox(height: size.height * 0.02),
                              BlocListener<ProfileCubit, ProfileState>(
                                bloc: profileCubit,
                                listenWhen: (previous, current) =>
                                    current is UploadUserProfileImageLoading ||
                                    current is UploadUserProfileImageSuccess ||
                                    current is UploadUserProfileImageError,
                                listener: (context, state) {
                                  if (state is UploadUserProfileImageLoading) {
                                    AppDialogs.showLoadingDialog(
                                      context,
                                      title: S
                                          .of(context)
                                          .loading_dialog_upload_user_profile_image,
                                    );
                                  }
                                  if (state is UploadUserProfileImageSuccess) {
                                    Navigator.of(
                                      context,
                                      rootNavigator: true,
                                    ).pop();
                                    AppDialogs.showSnackBar(
                                      context: context,
                                      message: state
                                          .uploadUserProfileImageResponseEntity
                                          .message,
                                    );
                                  }
                                  if (state is UploadUserProfileImageError) {
                                    Navigator.of(
                                      context,
                                      rootNavigator: true,
                                    ).pop();
                                    AppToast.showToast(
                                      context: context,
                                      title: S.of(context).app_toast_error,
                                      description: state.message,
                                      type: ToastificationType.error,
                                    );
                                  }
                                },
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.r),
                                  child: SecondaryGradientButtonWidget(
                                    icon: Icons.camera_alt_outlined,
                                    title: S.of(context).profile_page_button2,
                                    onPressed: () async {
                                      await profileCubit.uploadUserProfileImage(
                                        profileCubit.pickedUserProfileImage ??
                                            profileCubit.userProfileImage,
                                      );
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(height: size.height * 0.03),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.04),
                    BlocBuilder<ProfileCubit, ProfileState>(
                      bloc: profileCubit,
                      buildWhen: (previous, current) =>
                          current is ProfileLoaded,
                      builder: (context, state) {
                        if (state is ProfileLoaded) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: Column(
                              children: [
                                (state.userDataResponseEntity.user.role ==
                                            'recruiter' ||
                                        state.userDataResponseEntity.user
                                                .role ==
                                            'team')
                                    ? const SizedBox.shrink()
                                    : Column(
                                        children: [
                                          FinishedTracksWidget(
                                            userDataResponseEntity:
                                                state.userDataResponseEntity,
                                          ),
                                          SizedBox(height: size.height * 0.02),
                                        ],
                                      ),
                                (state.userDataResponseEntity.user.role ==
                                            'recruiter' ||
                                        state.userDataResponseEntity.user
                                                .role ==
                                            'team')
                                    ? const SizedBox.shrink()
                                    : Column(
                                        children: [
                                          FinishedSkillsWidget(
                                            userDataResponseEntity:
                                                state.userDataResponseEntity,
                                          ),
                                          SizedBox(height: size.height * 0.02),
                                        ],
                                      ),
                              ],
                            ),
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
