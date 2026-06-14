import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syntra_ai/core/utils/app_colors.dart';
import 'package:syntra_ai/core/utils/app_routes.dart';
import 'package:syntra_ai/core/utils/app_toast.dart';
import 'package:syntra_ai/features/auth/data/api/auth_api.dart';
import 'package:syntra_ai/features/auth/data/repo/data_source/auth_data_source_impl.dart';
import 'package:syntra_ai/features/auth/data/repo/repo/auth_repo_impl.dart';
import 'package:syntra_ai/features/auth/domain/entities/login/reset_password_request_entity.dart';
import 'package:syntra_ai/features/auth/domain/repo/data_source/auth_data_source.dart';
import 'package:syntra_ai/features/auth/domain/repo/repo/auth_repo.dart';
import 'package:syntra_ai/features/auth/domain/use_case/forget_password_use_case.dart';
import 'package:syntra_ai/features/auth/domain/use_case/login_with_email_and_password_use_case.dart';
import 'package:syntra_ai/features/auth/domain/use_case/login_with_github_use_case.dart';
import 'package:syntra_ai/features/auth/domain/use_case/login_with_google_use_case.dart';
import 'package:syntra_ai/features/auth/domain/use_case/register_use_case.dart';
import 'package:syntra_ai/features/auth/domain/use_case/reset_password_use_case.dart';
import 'package:syntra_ai/features/auth/domain/use_case/save_user_profile_use_case.dart';
import 'package:syntra_ai/features/auth/domain/use_case/send_otp_for_new_user_use_case.dart';
import 'package:syntra_ai/features/auth/domain/use_case/validate_otp_use_case.dart';
import 'package:syntra_ai/core/view/widgets/gradient_button_widget.dart';
import 'package:syntra_ai/features/auth/presentation/view/widgets/text_form_field_widget.dart';
import 'package:syntra_ai/features/auth/presentation/view/widgets/validator.dart';
import 'package:syntra_ai/features/auth/presentation/view_model/auth_cubit.dart';
import 'package:syntra_ai/generated/l10n.dart';
import 'package:toastification/toastification.dart';

class ResetPasswordPage extends StatefulWidget {
  final String email;
  final String otp;
  const ResetPasswordPage({super.key, required this.email, required this.otp});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final formKey = GlobalKey<FormState>();
  late AuthCubit authCubit;
  late final TextEditingController newPasswordController;
  late final TextEditingController confirmPasswordController;

  @override
  void initState() {
    super.initState();
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    AuthApi authApi = AuthApi();
    AuthDataSource authDataSource = AuthDataSourceImpl(authApi);
    AuthRepo authRepo = AuthRepoImpl(authDataSource);
    SaveUserProfileUseCase saveUserProfileUseCase =
        SaveUserProfileUseCase(authRepo);
    LoginWithEmailAndPasswordUseCase loginWithEmailAndPasswordUseCase =
        LoginWithEmailAndPasswordUseCase(authRepo);
    RegisterUseCase registerUseCase = RegisterUseCase(authRepo);
    LoginWithGoogleUseCase loginWithGoogleUseCase =
        LoginWithGoogleUseCase(authRepo);
    LoginWithGithubUseCase loginWithGithubUseCase =
        LoginWithGithubUseCase(authRepo);
    SendOtpForNewUserUseCase sendOtpForNewUserUseCase =
        SendOtpForNewUserUseCase(authRepo);
    // SendOtpForExistingUserUseCase sendOtpForExistingUserUseCase =
    //     SendOtpForExistingUserUseCase(authRepo);
    ValidateOtpUseCase validateOtpUseCase = ValidateOtpUseCase(authRepo);
    ForgetPasswordUseCase forgetPasswordUseCase =
        ForgetPasswordUseCase(authRepo);
    ResetPasswordUseCase resetPasswordUseCase = ResetPasswordUseCase(authRepo);
    authCubit = AuthCubit(
      saveUserProfileUseCase: saveUserProfileUseCase,
      loginWithEmailAndPasswordUseCase: loginWithEmailAndPasswordUseCase,
      registerUseCase: registerUseCase,
      loginWithGoogleUseCase: loginWithGoogleUseCase,
      loginWithGithubUseCase: loginWithGithubUseCase,
      sendOtpForNewUserUseCase: sendOtpForNewUserUseCase,
      // sendOtpForExistingUserUseCase: sendOtpForExistingUserUseCase,
      validateOtpUseCase: validateOtpUseCase,
      forgetPasswordUseCase: forgetPasswordUseCase,
      resetPasswordUseCase: resetPasswordUseCase,
    );
  }

  @override
  void dispose() {
    authCubit.close();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).reset_password_title1,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: BlocListener<AuthCubit, AuthState>(
        bloc: authCubit,
        listenWhen: (previous, current) =>
            current is ResetPasswordSuccess || current is ResetPasswordError,
        listener: (context, state) {
          if (state is ResetPasswordSuccess) {
            Navigator.of(context).pushNamed(AppRoutes.successfulResetPassword);
          }
          if (state is ResetPasswordError) {
            AppToast.showToast(
              context: context,
              title: S.of(context).app_toast_error,
              description: state.message,
              type: ToastificationType.error,
            );
          }
        },
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: EdgeInsets.only(
            top: 36.h,
            right: 16.w,
            left: 16.w,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16.h,
          ),
          child: Column(
            children: [
              Text(
                S.of(context).reset_password_title2,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color:
                          isLightMode ? null : AppColors.primary.withAlpha(200),
                    ),
                textAlign: TextAlign.center,
                // style: TextStyle(
                //   fontSize: 18.sp,
                //   fontWeight: FontWeight.w400,
                //   color: AppColors.secondary.withValues(alpha: 0.8),
                // ),
              ),
              SizedBox(height: size.height * 0.05),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).reset_password_new_password,
                      style: Theme.of(context).textTheme.bodyMedium,
                      // style: TextStyle(
                      //   fontSize: 18.sp,
                      //   fontWeight: FontWeight.w500,
                      //   color: AppColors.black,
                      // ),
                    ),
                    SizedBox(height: size.height * 0.01),
                    TextFormFieldWidget(
                      isPassword: true,
                      obscureText: true,
                      controller: newPasswordController,
                      validator: Validator.validatePassword,
                      hintText:
                          S.of(context).reset_password_new_password_hint_text,
                    ),
                    SizedBox(height: size.height * 0.04),
                    Text(
                      S.of(context).reset_password_confirm_password,
                      style: Theme.of(context).textTheme.bodyMedium,
                      // style: TextStyle(
                      //   fontSize: 18.sp,
                      //   fontWeight: FontWeight.w500,
                      //   color: AppColors.black,
                      // ),
                    ),
                    SizedBox(height: size.height * 0.01),
                    TextFormFieldWidget(
                      isPassword: true,
                      obscureText: true,
                      controller: confirmPasswordController,
                      validator: (value) => Validator.validateConfirmPassword(
                        value,
                        newPasswordController.text.trim(),
                      ),
                      hintText: S
                          .of(context)
                          .reset_password_confirm_password_hint_text,
                    ),
                    SizedBox(height: size.height * 0.05),
                    GradientButtonWidget(
                      title: S.of(context).reset_password_button,
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          await authCubit.resetPassword(
                            ResetPasswordRequestEntity(
                              email: widget.email,
                              password: newPasswordController.text.trim(),
                              passwordConfirm:
                                  confirmPasswordController.text.trim(),
                            ),
                          );
                          // if (!context.mounted) {
                          //   return;
                          // }
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
