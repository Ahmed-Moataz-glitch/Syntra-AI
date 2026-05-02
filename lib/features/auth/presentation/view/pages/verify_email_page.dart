// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:syntra_ai/core/utils/app_colors.dart';
import 'package:syntra_ai/core/utils/app_dialogs.dart';
import 'package:syntra_ai/core/utils/app_routes.dart';
import 'package:syntra_ai/features/auth/data/api/auth_api.dart';
import 'package:syntra_ai/features/auth/data/repo/data_source/auth_data_source_impl.dart';
import 'package:syntra_ai/features/auth/data/repo/repo/auth_repo_impl.dart';
import 'package:syntra_ai/features/auth/domain/repo/data_source/auth_data_source.dart';
import 'package:syntra_ai/features/auth/domain/repo/repo/auth_repo.dart';
import 'package:syntra_ai/features/auth/domain/use_case/login_with_email_and_password_use_case.dart';
import 'package:syntra_ai/features/auth/domain/use_case/login_with_github_use_case.dart';
import 'package:syntra_ai/features/auth/domain/use_case/login_with_google_use_case.dart';
import 'package:syntra_ai/features/auth/domain/use_case/register_use_case.dart';
import 'package:syntra_ai/features/auth/domain/use_case/reset_password_use_case.dart';
import 'package:syntra_ai/features/auth/domain/use_case/save_user_profile_use_case.dart';
import 'package:syntra_ai/features/auth/domain/use_case/send_otp_for_existing_user_use_case.dart';
import 'package:syntra_ai/features/auth/domain/use_case/send_otp_for_new_user_use_case.dart';
import 'package:syntra_ai/features/auth/domain/use_case/validate_otp_use_case.dart';
import 'package:syntra_ai/features/auth/presentation/view/widgets/gradient_button_widget.dart';
import 'package:syntra_ai/features/auth/presentation/view/widgets/timer_widget.dart';
import 'package:syntra_ai/features/auth/presentation/view/widgets/verify_code_widget.dart';
import 'package:syntra_ai/features/auth/presentation/view_model/auth_cubit.dart';
import 'package:syntra_ai/generated/l10n.dart';

class VerifyEmailPage extends StatefulWidget {
  final String? email;
  const VerifyEmailPage({super.key, required this.email});

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  late PinInputController otpController;
  late AuthCubit authCubit;

  @override
  void initState() {
    super.initState();
    otpController = PinInputController();
    AuthApi authApi = AuthApi();
    AuthDataSource authDataSource = AuthDataSourceImpl(authApi);
    AuthRepo authRepo = AuthRepoImpl(authDataSource);
    SaveUserProfileUseCase saveUserProfileUseCase = SaveUserProfileUseCase(authRepo);
    LoginWithEmailAndPasswordUseCase loginWithEmailAndPasswordUseCase = LoginWithEmailAndPasswordUseCase(authRepo);
    RegisterUseCase registerUseCase = RegisterUseCase(authRepo);
    LoginWithGoogleUseCase loginWithGoogleUseCase = LoginWithGoogleUseCase(authRepo);
    LoginWithGithubUseCase loginWithGithubUseCase = LoginWithGithubUseCase(authRepo);
    SendOtpForNewUserUseCase sendOtpForNewUserUseCase = SendOtpForNewUserUseCase(authRepo);
    SendOtpForExistingUserUseCase sendOtpForExistingUserUseCase = SendOtpForExistingUserUseCase(authRepo);
    ValidateOtpUseCase validateOtpUseCase = ValidateOtpUseCase(authRepo);
    ResetPasswordUseCase resetPasswordUseCase = ResetPasswordUseCase(authRepo);
    authCubit = AuthCubit(
      saveUserProfileUseCase: saveUserProfileUseCase,
      loginWithEmailAndPasswordUseCase: loginWithEmailAndPasswordUseCase,
      registerUseCase: registerUseCase,
      loginWithGoogleUseCase: loginWithGoogleUseCase,
      loginWithGithubUseCase: loginWithGithubUseCase,
      sendOtpForNewUserUseCase: sendOtpForNewUserUseCase,
      sendOtpForExistingUserUseCase: sendOtpForExistingUserUseCase,
      validateOtpUseCase: validateOtpUseCase,
      resetPasswordUseCase: resetPasswordUseCase,
    );
  }

  @override
  void dispose() {
    authCubit.close();
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).verify_title1,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: BlocListener<AuthCubit, AuthState>(
        bloc: authCubit,
        listenWhen: (previous, current) =>
            current is ReSendingOtp ||
            current is OtpReSent ||
            current is ReSendingOtpError ||
            current is OtpVerified ||
            current is VerifyingOtpError,
        listener: (context, state) {
          if (state is ReSendingOtp) {
            AppDialogs.showLoadingDialog(context, title: S.of(context).loading_dialog_verify);
          }
          if (state is OtpReSent) {
            AppDialogs.showSnackBar(context: context, message: state.message);
          }
          if (state is ReSendingOtpError) {
            Navigator.of(context).pop();
            AppDialogs.showSnackBar(
              context: context,
              message: state.message,
              isError: true,
            );
          }
          if (state is OtpVerified) {
            Navigator.of(
              context,
            ).pushNamedAndRemoveUntil(AppRoutes.login, (route) => false);
          }
          if (state is VerifyingOtpError) {
            AppDialogs.showSnackBar(
              context: context,
              message: state.message,
              isError: true,
            );
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 36.h),
          child: Column(
            children: [
              Text(
                S.of(context).verify_title2,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: isLightMode ? null : AppColors.primary.withAlpha(200),
                ),
                textAlign: TextAlign.center,
                // style: TextStyle(
                //   fontSize: 18.sp,
                //   fontWeight: FontWeight.w400,
                //   color: AppColors.secondary.withValues(alpha: 0.8),
                // ),
              ),
              SizedBox(height: size.height * 0.05),
              Text.rich(
                overflow: TextOverflow.ellipsis,
                TextSpan(
                  text: S.of(context).verify_title3,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: isLightMode ? null : AppColors.primary.withAlpha(200),
                  ),
                  // style: TextStyle(fontSize: 16.sp, color: AppColors.black),
                  children: [
                    TextSpan(
                      text: widget.email ?? 'ahmedmoataz123@gmail.com',
                      style: Theme.of(context).textTheme.bodyMedium,
                      // style: TextStyle(
                      //   fontSize: 18.sp,
                      //   color: AppColors.black,
                      //   fontWeight: FontWeight.bold,
                      // ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.04),
              VerifyCodeWidget(pinController: otpController),
              SizedBox(height: size.height * 0.04),
              GradientButtonWidget(
                title: S.of(context).verify_button,
                onPressed: () async {
                  // debugPrint('Verification code: ${verificationController.text}');
                  // debugPrint('Email: $email, OTP: ${otpController.text}');
                  await authCubit.validateOtp(
                    email: widget.email ?? '',
                    otp: otpController.text.trim(),
                  );
                },
              ),
              SizedBox(height: size.height * 0.02),
              GestureDetector(
                onTap: () async {
                  await authCubit.resendOtpForNewUser(widget.email ?? '');
                },
                child: Text.rich(
                  TextSpan(
                    text: S.of(context).verify_title4,
                    style: Theme.of(context).textTheme.titleMedium,
                    // style: TextStyle(fontSize: 16.sp, color: AppColors.black),
                    children: [
                      TextSpan(
                        text: S.of(context).verify_title5,
                        style: Theme.of(context).textTheme.bodySmall,
                        // style: TextStyle(
                        //   fontSize: 16.sp,
                        //   fontWeight: FontWeight.bold,
                        //   color: AppColors.blue,
                        // ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              const TimerWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
