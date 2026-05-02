import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syntra_ai/core/utils/app_assets.dart';
import 'package:syntra_ai/core/utils/app_colors.dart';
import 'package:syntra_ai/core/utils/app_dialogs.dart';
import 'package:syntra_ai/core/utils/app_routes.dart';
import 'package:syntra_ai/core/utils/app_toast.dart';
import 'package:syntra_ai/core/view/widgets/logo_widget.dart';
import 'package:syntra_ai/features/auth/data/api/auth_api.dart';
import 'package:syntra_ai/features/auth/data/repo/data_source/auth_data_source_impl.dart';
import 'package:syntra_ai/features/auth/data/repo/repo/auth_repo_impl.dart';
import 'package:syntra_ai/features/auth/domain/entities/login/login_request_entity.dart';
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
import 'package:syntra_ai/features/auth/presentation/view/widgets/login_method_widget.dart';
import 'package:syntra_ai/features/auth/presentation/view/widgets/text_form_field_widget.dart';
import 'package:syntra_ai/features/auth/presentation/view/widgets/validator.dart';
import 'package:syntra_ai/features/auth/presentation/view_model/auth_cubit.dart';
import 'package:syntra_ai/generated/l10n.dart';
import 'package:toastification/toastification.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  late AuthCubit authCubit;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    AuthApi authApi = AuthApi();
    AuthDataSource authDataSource = AuthDataSourceImpl(authApi);
    AuthRepo authRepo = AuthRepoImpl(authDataSource);
    SaveUserProfileUseCase saveUserProfileUseCase = SaveUserProfileUseCase(authRepo);
    LoginWithEmailAndPasswordUseCase loginWithEmailAndPasswordUseCase =
        LoginWithEmailAndPasswordUseCase(authRepo);
    RegisterUseCase registerUseCase = RegisterUseCase(authRepo);
    LoginWithGoogleUseCase loginWithGoogleUseCase = LoginWithGoogleUseCase(
      authRepo,
    );
    LoginWithGithubUseCase loginWithGithubUseCase = LoginWithGithubUseCase(
      authRepo,
    );
    SendOtpForNewUserUseCase sendOtpForNewUserUseCase =
        SendOtpForNewUserUseCase(authRepo);
    SendOtpForExistingUserUseCase sendOtpForExistingUserUseCase =
        SendOtpForExistingUserUseCase(authRepo);
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
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    authCubit.close();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: SizedBox(
          width: size.width * 0.425,
          height: size.height * 0.07,
          child: const LogoWidget(),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.transparent,
      ),
      body: BlocListener<AuthCubit, AuthState>(
        bloc: authCubit,
        listenWhen: (previous, current) =>
            current is AuthLoading ||
            current is AuthSuccess ||
            current is AuthError ||
            current is SaveUserProfileError,
        listener: (context, state) {
          if (state is AuthLoading) {
            AppDialogs.showLoadingDialog(context, title: S.of(context).loading_dialog_login);
          }
          if (state is AuthError) {
            Navigator.of(context).pop();
            AppToast.showToast(
              context: context,
              title: S.of(context).app_toast_error,
              description: state.message,
              type: ToastificationType.error,
            );
          }
          if(state is SaveUserProfileError) {
            AppToast.showToast(
              context: context,
              title: S.of(context).app_toast_error,
              description: state.message,
              type: ToastificationType.error,
            );
          }
          if (state is AuthSuccess) {
            // AppToast.showToast(
            //   context: context,
            //   title: "Success",
            //   description: "Login Successfully",
            //   type: ToastificationType.success,
            // );
            Navigator.of(
              context,
              rootNavigator: true,
            ).pushNamedAndRemoveUntil(AppRoutes.appSection, (route) => false);
          }
        },
        child: SafeArea(
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: EdgeInsets.only(
              right: 16.w,
              left: 16.w,
              bottom: MediaQuery.of(context).viewInsets.bottom + 16.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height * 0.05),
                Text(
                  S.of(context).login_title1,
                  style: Theme.of(context).textTheme.headlineLarge,
                  // style: TextStyle(
                  //   fontSize: 32.sp,
                  //   fontWeight: FontWeight.w500,
                  //   color: AppColors.black,
                  // ),
                ),
                SizedBox(height: size.height * 0.02),
                Text(
                  S.of(context).login_title2,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontSize: 16.sp,    
                    color: isLightMode ? null : AppColors.primary.withAlpha(150),
                  ),
                  // style: TextStyle(
                  //   fontSize: 16.sp,
                  //   fontWeight: FontWeight.w500,
                  //   color: AppColors.secondary,
                  // ),
                ),
                SizedBox(height: size.height * 0.05),
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).login_email,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 18.sp,
                          color: isLightMode ? null : AppColors.primary.withAlpha(220),
                        ),
                        // style: TextStyle(
                        //   fontSize: 18.sp,
                        //   fontWeight: FontWeight.w500,
                        //   color: AppColors.black,
                        // ),
                      ),
                      SizedBox(height: size.height * 0.01),
                      TextFormFieldWidget(
                        controller: emailController,
                        validator: Validator.validateEmail,
                        hintText: S.of(context).login_email_hint_text,
                      ),
                      SizedBox(height: size.height * 0.03),
                      Text(
                        S.of(context).login_password,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 18.sp,
                          color: isLightMode ? null : AppColors.primary.withAlpha(220),
                        ),
                        // style: TextStyle(
                        //   fontSize: 18.sp,
                        //   fontWeight: FontWeight.w500,
                        //   color: AppColors.black,
                        // ),
                      ),
                      SizedBox(height: size.height * 0.01),
                      TextFormFieldWidget(
                        controller: passwordController,
                        validator: Validator.validatePassword,
                        hintText: '************',
                        isPassword: true,
                        obscureText: true,
                      ),
                      SizedBox(height: size.height * 0.01),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(
                              context,
                            ).pushNamed(AppRoutes.forgetPassword);
                          },
                          child: Text(
                            S.of(context).login_forget_password,
                            style: Theme.of(context).textTheme.bodySmall,
                            // style: TextStyle(
                            //   fontSize: 14.sp,
                            //   fontWeight: FontWeight.w700,
                            //   color: AppColors.blue,
                            // ),
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.03),
                      GradientButtonWidget(
                        title: S.of(context).login_button,
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            await authCubit.loginWithEmailAndPassword(
                              LoginRequestEntity(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: isLightMode ? AppColors.primary.withAlpha(160) : AppColors.primary.withAlpha(150),
                        // color: AppColors.dividerColor,
                        // thickness: 1,
                        // height: 32.h,
                        // indent: 8.w,
                        // endIndent: 10.w,
                      ),
                    ),
                    Text(
                      S.of(context).login_title3,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: isLightMode ? null : AppColors.primary.withAlpha(200),
                      ),
                      // style: TextStyle(
                      //   fontSize: 14.sp,
                      //   fontWeight: FontWeight.w500,
                      //   color: AppColors.semiBlack,
                      // ),
                    ),
                    Expanded(
                      child: Divider(
                        color: isLightMode ? AppColors.primary.withAlpha(160) : AppColors.primary.withAlpha(150),
                        // color: AppColors.dividerColor,
                        // thickness: 1,
                        // height: 32.h,
                        // indent: 10.w,
                        // endIndent: 8.w,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.02),
                BlocListener<AuthCubit, AuthState>(
                  bloc: authCubit,
                  listenWhen: (previous, current) => current is LoginWithOtherMethodError ||
                      current is LoginWithOtherMethodSuccess,
                  listener: (context, state) {
                    if(state is LoginWithOtherMethodError) {
                      AppToast.showToast(
                        context: context,
                        title: S.of(context).app_toast_error,
                        description: state.message,
                        type: ToastificationType.error,
                      );
                    }
                    if(state is LoginWithOtherMethodSuccess) {
                      // AppToast.showToast(
                      //   context: context,
                      //   title: "Success",
                      //   description: "Login Successfully",
                      //   type: ToastificationType.success,
                      // );
                      Navigator.of(
                        context,
                        rootNavigator: true,
                      ).pushNamedAndRemoveUntil(AppRoutes.appSection, (route) => false);
                    }
                  },
                  child: Row(
                    children: [
                      LoginMethodWidget(
                        iconPath: AppAssets.googleIcon,
                        title: S.of(context).login_google,
                        onTap: () async {
                          await authCubit.loginWithGoogle();
                        },
                      ),
                      SizedBox(width: size.width * 0.04),
                      LoginMethodWidget(
                        iconPath: AppAssets.githubIcon,
                        title: S.of(context).login_github,
                        onTap: () async {
                          await authCubit.loginWithGitHub();
                        },
                      ),
                    ],
                  ),
                ),
                // SizedBox(height: size.height * 0.04),
                // const Spacer(),
                SizedBox(height: size.height * 0.13),
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () => Navigator.of(
                      context,
                    ).pushReplacementNamed(AppRoutes.register),
                    child: Text.rich(
                      TextSpan(
                        text: S.of(context).login_title4,
                        style: Theme.of(context).textTheme.displaySmall,
                        // style: TextStyle(
                        //   fontSize: 14.sp,
                        //   fontWeight: FontWeight.w700,
                        //   color: AppColors.black,
                        // ),
                        children: [
                          TextSpan(
                            text: S.of(context).login_signup,
                            style: Theme.of(context).textTheme.bodySmall,
                            // style: TextStyle(
                            //   fontSize: 14.sp,
                            //   fontWeight: FontWeight.w700,
                            //   color: AppColors.blue,
                            // ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // const Spacer(),
                // Align(
                //   alignment: Alignment.center,
                //   child: Text(
                //     'Syntra.AI © 2026. Secure Encrypted Connection.',
                //     style: TextStyle(
                //       fontSize: 12,
                //       fontWeight: FontWeight.w500,
                //       color: AppColors.hintTextColor,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
