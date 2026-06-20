// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syntra_ai/core/utils/app_colors.dart';
import 'package:syntra_ai/core/utils/app_dialogs.dart';
import 'package:syntra_ai/core/utils/app_routes.dart';
import 'package:syntra_ai/core/utils/app_toast.dart';
import 'package:syntra_ai/core/view/widgets/logo_widget.dart';
import 'package:syntra_ai/features/auth/data/api/auth_api.dart';
import 'package:syntra_ai/features/auth/data/model/register/roles_model.dart';
import 'package:syntra_ai/features/auth/data/repo/data_source/auth_data_source_impl.dart';
import 'package:syntra_ai/features/auth/data/repo/repo/auth_repo_impl.dart';
import 'package:syntra_ai/features/auth/domain/entities/register/register_request_entity.dart';
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

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  late final TextEditingController fullNameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final AuthCubit authCubit;
  late String selectedRole;
  late bool isTermsAccepted;

  @override
  void initState() {
    super.initState();
    fullNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    AuthApi authApi = AuthApi();
    AuthDataSource authDataSource = AuthDataSourceImpl(authApi);
    AuthRepo authRepo = AuthRepoImpl(authDataSource);
    SaveUserProfileUseCase saveUserProfileUseCase = SaveUserProfileUseCase(
      authRepo,
    );
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
    // SendOtpForExistingUserUseCase sendOtpForExistingUserUseCase =
    //     SendOtpForExistingUserUseCase(authRepo);
    ValidateOtpUseCase validateOtpUseCase = ValidateOtpUseCase(authRepo);
    ForgetPasswordUseCase forgetPasswordUseCase = ForgetPasswordUseCase(authRepo);
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
    selectedRole = '';
    isTermsAccepted = false;
  }

  @override
  void dispose() {
    authCubit.close();
    fullNameController.dispose();
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
          width: size.width * 0.44,
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
            current is RegisterError ||
            current is RegisterSuccess ||
            current is OtpSent ||
            current is SendingOtp ||
            current is SendingOtpError,
        listener: (context, state) {
          if (state is RegisterError) {
            AppToast.showToast(
              context: context,
              title: S.of(context).app_toast_error,
              description: state.message,
              type: ToastificationType.error,
            );
          }
          if (state is RegisterSuccess) {
            // AppToast.showToast(
            //   context: context,
            //   title: "Success",
            //   description: "Registration Successfully",
            //   type: ToastificationType.success,
            // );
            Navigator.of(context).pushNamed(
              AppRoutes.verifyEmail,
              arguments: emailController.text.trim(),
            );
          }
          if (state is SendingOtp) {
            AppDialogs.showLoadingDialog(context,
                title: S.of(context).loading_dialog_signup_forget_password);
          }
          if (state is OtpSent) {
            AppDialogs.showSnackBar(context: context, message: state.message);
          }
          if (state is SendingOtpError) {
            Navigator.of(context).pop();
            AppDialogs.showSnackBar(
              context: context,
              message: state.message,
              isError: true,
            );
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
                  S.of(context).signup_title1,
                  style: Theme.of(context).textTheme.headlineLarge,
                  // style: TextStyle(
                  //   fontSize: 32.sp,
                  //   fontWeight: FontWeight.w500,
                  //   color: AppColors.black,
                  // ),
                ),
                SizedBox(height: size.height * 0.02),
                GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 24.w,
                  ),
                  itemCount: rolesList.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      splashFactory: NoSplash.splashFactory,
                      onTap: () {
                        setState(() {
                          rolesList = rolesList
                              .map((role) => role.copyWith(isSelected: false))
                              .toList();
                          rolesList[index] = rolesList[index].copyWith(
                            isSelected: true,
                          );
                          rolesList[index].isSelected
                              ? selectedRole = rolesList
                                  .where((role) => role.isSelected)
                                  .toList()[0]
                                  .title(context)
                                  .toLowerCase()
                              : selectedRole = '';
                        });
                      },
                      child: Container(
                        height: size.height * 0.1,
                        decoration: BoxDecoration(
                          color: rolesList[index].isSelected
                              ? isLightMode
                                  ? AppColors.blue.withAlpha(35)
                                  : AppColors.primary.withAlpha(240)
                              : null,
                          border: Border.all(
                            color: rolesList[index].isSelected
                                ? !isLightMode
                                    ? AppColors.transparent
                                    : AppColors.blue
                                : AppColors.dividerColor,
                            width: rolesList[index].isSelected ? 2.r : 1.5.r,
                          ),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              rolesList[index].iconData,
                              size: 32.sp,
                              color: rolesList[index].isSelected
                                  ? AppColors.blue
                                  : AppColors.secondary,
                            ),
                            Text(
                              rolesList[index].title(context),
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                color: rolesList[index].isSelected
                                    ? AppColors.blue
                                    : AppColors.dividerColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: size.height * 0.03),
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).signup_full_name,
                        style: Theme.of(context).textTheme.bodyMedium,
                        // style: TextStyle(
                        //   fontSize: 18.sp,
                        //   fontWeight: FontWeight.w500,
                        //   color: AppColors.black,
                        // ),
                      ),
                      SizedBox(height: size.height * 0.01),
                      TextFormFieldWidget(
                        controller: fullNameController,
                        validator: Validator.validateName,
                        hintText: S.of(context).signup_full_name_hint_text,
                        isFullName: true,
                      ),
                      SizedBox(height: size.height * 0.03),
                      Text(
                        S.of(context).signup_email,
                        style: Theme.of(context).textTheme.bodyMedium,
                        // style: TextStyle(
                        //   fontSize: 18.sp,
                        //   fontWeight: FontWeight.w500,
                        //   color: AppColors.black,
                        // ),
                      ),
                      SizedBox(height: size.height * 0.01),
                      TextFormFieldWidget(
                        controller: emailController,
                        isEmail: true,
                        validator: Validator.validateEmail,
                        hintText: S.of(context).signup_email_hint_text,
                      ),
                      SizedBox(height: size.height * 0.03),
                      Text(
                        S.of(context).signup_password,
                        style: Theme.of(context).textTheme.bodyMedium,
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
                        hintText: S.of(context).signup_password_hint_text,
                        isPassword: true,
                        obscureText: true,
                      ),
                      SizedBox(height: size.height * 0.01),
                      Padding(
                        padding: EdgeInsets.only(left: 8.w),
                        child: Row(
                          spacing: 8.w,
                          children: [
                            SizedBox(
                              width: 24.w,
                              child: Checkbox(
                                value: isTermsAccepted,
                                onChanged: (newValue) {
                                  setState(() {
                                    isTermsAccepted = newValue ?? false;
                                  });
                                },
                                activeColor: AppColors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.r),
                                ),
                              ),
                            ),
                            Text.rich(
                              textScaler: isLightMode ? TextScaler.linear(1.1) : TextScaler.linear(1),
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: S.of(context).signup_title2,
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  TextSpan(
                                    text: S.of(context).signup_title3,
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w800,
                                      color: AppColors.blue,
                                    ),
                                  ),
                                  TextSpan(
                                    text: S.of(context).signup_title4,
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  TextSpan(
                                    text: S.of(context).signup_title5,
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w800,
                                      color: AppColors.blue,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: size.height * 0.04),
                      GradientButtonWidget(
                        title: S.of(context).signup_button,
                        onPressed: () async {
                          if (formKey.currentState!.validate() &&
                              selectedRole.isNotEmpty &&
                              isTermsAccepted) {
                            debugPrint(
                                'Email: ${emailController.text}, Password: ${passwordController.text}, Full Name: ${fullNameController.text}, Role: $selectedRole');
                            await authCubit.register(
                              RegisterRequestEntity(
                                name: fullNameController.text.trim(),
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                                role: selectedRole,
                              ),
                            );
                            // await authCubit.sendOtpForNewUser(
                            //   emailController.text.trim(),
                            // );
                          }
                        },
                      ),
                    ],
                  ),
                ),

                // SizedBox(height: size.height * 0.02),
                // Row(
                //   children: [
                //     Expanded(
                //       child: Divider(
                //         color: AppColors.dividerColor,
                //         thickness: 1,
                //         height: 32,
                //         indent: 8,
                //         endIndent: 10,
                //       ),
                //     ),
                //     Text(
                //       'or continue with',
                //       style: TextStyle(
                //         fontSize: 14,
                //         fontWeight: FontWeight.w500,
                //         color: AppColors.semiBlack,
                //       ),
                //     ),
                //     Expanded(
                //       child: Divider(
                //         color: AppColors.dividerColor,
                //         thickness: 1,
                //         height: 32,
                //         indent: 10,
                //         endIndent: 8,
                //       ),
                //     ),
                //   ],
                // ),
                // SizedBox(height: size.height * 0.02),
                // Row(
                //   children: [
                //     SecondaryRegisterMethodWidget(iconPath: AppAssets.googleIcon, title: 'Google'),
                //     SizedBox(width: size.width * 0.04),
                //     SecondaryRegisterMethodWidget(iconPath: AppAssets.githubIcon, title: 'Github'),
                //   ],
                // ),
                // SizedBox(height: size.height * 0.03),
                // const Spacer(),
                SizedBox(height: size.height * 0.015),
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () => Navigator.of(
                      context,
                    ).pushReplacementNamed(AppRoutes.login),
                    child: Text.rich(
                      TextSpan(
                        text: S.of(context).signup_title6,
                        style: Theme.of(context).textTheme.displaySmall,
                        // style: TextStyle(
                        //   fontSize: 14.sp,
                        //   fontWeight: FontWeight.w700,
                        //   color: AppColors.black,
                        // ),
                        children: [
                          TextSpan(
                            text: S.of(context).signup_login,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
