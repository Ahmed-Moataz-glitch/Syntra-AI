// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Syntra.Ai`
  String get onboarding_page1_title1 {
    return Intl.message(
      'Syntra.Ai',
      name: 'onboarding_page1_title1',
      desc: '',
      args: [],
    );
  }

  /// `Developed by Ahmed Glitch`
  String get onboarding_page1_title2 {
    return Intl.message(
      'Developed by Ahmed Glitch',
      name: 'onboarding_page1_title2',
      desc: '',
      args: [],
    );
  }

  /// `Learner Flow`
  String get onboarding_page2_title1 {
    return Intl.message(
      'Learner Flow',
      name: 'onboarding_page2_title1',
      desc: '',
      args: [],
    );
  }

  /// `Personalized learning through AI roadmap, verified projects, auto generated CV, apply for jobs`
  String get onboarding_page2_title2 {
    return Intl.message(
      'Personalized learning through AI roadmap, verified projects, auto generated CV, apply for jobs',
      name: 'onboarding_page2_title2',
      desc: '',
      args: [],
    );
  }

  /// `Team Flow`
  String get onboarding_page3_title1 {
    return Intl.message(
      'Team Flow',
      name: 'onboarding_page3_title1',
      desc: '',
      args: [],
    );
  }

  /// `AI task assignment, collaboration, auto-documentation`
  String get onboarding_page3_title2 {
    return Intl.message(
      'AI task assignment, collaboration, auto-documentation',
      name: 'onboarding_page3_title2',
      desc: '',
      args: [],
    );
  }

  /// `Employer Flow`
  String get onboarding_page4_title1 {
    return Intl.message(
      'Employer Flow',
      name: 'onboarding_page4_title1',
      desc: '',
      args: [],
    );
  }

  /// `Search verified talent, view portfolios, send interviews, send internships`
  String get onboarding_page4_title2 {
    return Intl.message(
      'Search verified talent, view portfolios, send interviews, send internships',
      name: 'onboarding_page4_title2',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get onboarding_page_button_case1 {
    return Intl.message(
      'Next',
      name: 'onboarding_page_button_case1',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get onboarding_page_button_case2 {
    return Intl.message(
      'Get Started',
      name: 'onboarding_page_button_case2',
      desc: '',
      args: [],
    );
  }

  /// `Welcome back`
  String get login_title1 {
    return Intl.message(
      'Welcome back',
      name: 'login_title1',
      desc: '',
      args: [],
    );
  }

  /// `Enter your details to access your workspace.`
  String get login_title2 {
    return Intl.message(
      'Enter your details to access your workspace.',
      name: 'login_title2',
      desc: '',
      args: [],
    );
  }

  /// `Email address`
  String get login_email {
    return Intl.message(
      'Email address',
      name: 'login_email',
      desc: '',
      args: [],
    );
  }

  /// `name@example.com`
  String get login_email_hint_text {
    return Intl.message(
      'name@example.com',
      name: 'login_email_hint_text',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get login_password {
    return Intl.message(
      'Password',
      name: 'login_password',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password?`
  String get login_forget_password {
    return Intl.message(
      'Forget Password?',
      name: 'login_forget_password',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get login_button {
    return Intl.message(
      'Sign In',
      name: 'login_button',
      desc: '',
      args: [],
    );
  }

  /// `or continue with`
  String get login_title3 {
    return Intl.message(
      'or continue with',
      name: 'login_title3',
      desc: '',
      args: [],
    );
  }

  /// `Google`
  String get login_google {
    return Intl.message(
      'Google',
      name: 'login_google',
      desc: '',
      args: [],
    );
  }

  /// `GitHub`
  String get login_github {
    return Intl.message(
      'GitHub',
      name: 'login_github',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account? `
  String get login_title4 {
    return Intl.message(
      'Don\'t have an account? ',
      name: 'login_title4',
      desc: '',
      args: [],
    );
  }

  /// `Create one`
  String get login_signup {
    return Intl.message(
      'Create one',
      name: 'login_signup',
      desc: '',
      args: [],
    );
  }

  /// `Create your account`
  String get signup_title1 {
    return Intl.message(
      'Create your account',
      name: 'signup_title1',
      desc: '',
      args: [],
    );
  }

  /// `Learner`
  String get signup_role1 {
    return Intl.message(
      'Learner',
      name: 'signup_role1',
      desc: '',
      args: [],
    );
  }

  /// `Team`
  String get signup_role2 {
    return Intl.message(
      'Team',
      name: 'signup_role2',
      desc: '',
      args: [],
    );
  }

  /// `Recruiter`
  String get signup_role3 {
    return Intl.message(
      'Recruiter',
      name: 'signup_role3',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get signup_full_name {
    return Intl.message(
      'Full Name',
      name: 'signup_full_name',
      desc: '',
      args: [],
    );
  }

  /// `enter your full name`
  String get signup_full_name_hint_text {
    return Intl.message(
      'enter your full name',
      name: 'signup_full_name_hint_text',
      desc: '',
      args: [],
    );
  }

  /// `Email address`
  String get signup_email {
    return Intl.message(
      'Email address',
      name: 'signup_email',
      desc: '',
      args: [],
    );
  }

  /// `create an email`
  String get signup_email_hint_text {
    return Intl.message(
      'create an email',
      name: 'signup_email_hint_text',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get signup_password {
    return Intl.message(
      'Password',
      name: 'signup_password',
      desc: '',
      args: [],
    );
  }

  /// `create a password`
  String get signup_password_hint_text {
    return Intl.message(
      'create a password',
      name: 'signup_password_hint_text',
      desc: '',
      args: [],
    );
  }

  /// `I agree to the `
  String get signup_title2 {
    return Intl.message(
      'I agree to the ',
      name: 'signup_title2',
      desc: '',
      args: [],
    );
  }

  /// `Terms and Conditions `
  String get signup_title3 {
    return Intl.message(
      'Terms and Conditions ',
      name: 'signup_title3',
      desc: '',
      args: [],
    );
  }

  /// `and `
  String get signup_title4 {
    return Intl.message(
      'and ',
      name: 'signup_title4',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get signup_title5 {
    return Intl.message(
      'Privacy Policy',
      name: 'signup_title5',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signup_button {
    return Intl.message(
      'Sign Up',
      name: 'signup_button',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account? `
  String get signup_title6 {
    return Intl.message(
      'Already have an account? ',
      name: 'signup_title6',
      desc: '',
      args: [],
    );
  }

  /// `Log in`
  String get signup_login {
    return Intl.message(
      'Log in',
      name: 'signup_login',
      desc: '',
      args: [],
    );
  }

  /// `Verification`
  String get verify_title1 {
    return Intl.message(
      'Verification',
      name: 'verify_title1',
      desc: '',
      args: [],
    );
  }

  /// `Please provide the email address that you used when signed up for your account`
  String get verify_title2 {
    return Intl.message(
      'Please provide the email address that you used when signed up for your account',
      name: 'verify_title2',
      desc: '',
      args: [],
    );
  }

  /// `Code sent to `
  String get verify_title3 {
    return Intl.message(
      'Code sent to ',
      name: 'verify_title3',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get verify_button {
    return Intl.message(
      'Verify',
      name: 'verify_button',
      desc: '',
      args: [],
    );
  }

  /// `Don't receive code? `
  String get verify_title4 {
    return Intl.message(
      'Don\'t receive code? ',
      name: 'verify_title4',
      desc: '',
      args: [],
    );
  }

  /// `Resend Code`
  String get verify_title5 {
    return Intl.message(
      'Resend Code',
      name: 'verify_title5',
      desc: '',
      args: [],
    );
  }

  /// `Resend code in `
  String get timer_title {
    return Intl.message(
      'Resend code in ',
      name: 'timer_title',
      desc: '',
      args: [],
    );
  }

  /// `Forget password`
  String get forget_password_title1 {
    return Intl.message(
      'Forget password',
      name: 'forget_password_title1',
      desc: '',
      args: [],
    );
  }

  /// `Please provide the email address that you used when signed up for your account`
  String get forget_password_title2 {
    return Intl.message(
      'Please provide the email address that you used when signed up for your account',
      name: 'forget_password_title2',
      desc: '',
      args: [],
    );
  }

  /// `Email address`
  String get forget_password_email {
    return Intl.message(
      'Email address',
      name: 'forget_password_email',
      desc: '',
      args: [],
    );
  }

  /// `name@example.com`
  String get forget_password_email_hint_text {
    return Intl.message(
      'name@example.com',
      name: 'forget_password_email_hint_text',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get forget_password_button {
    return Intl.message(
      'Send',
      name: 'forget_password_button',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get reset_password_title1 {
    return Intl.message(
      'Reset Password',
      name: 'reset_password_title1',
      desc: '',
      args: [],
    );
  }

  /// `Please provide the email address that you used when signed up for your account`
  String get reset_password_title2 {
    return Intl.message(
      'Please provide the email address that you used when signed up for your account',
      name: 'reset_password_title2',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get reset_password_new_password {
    return Intl.message(
      'New Password',
      name: 'reset_password_new_password',
      desc: '',
      args: [],
    );
  }

  /// `Enter new password`
  String get reset_password_new_password_hint_text {
    return Intl.message(
      'Enter new password',
      name: 'reset_password_new_password_hint_text',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get reset_password_confirm_password {
    return Intl.message(
      'Confirm Password',
      name: 'reset_password_confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `confirm password`
  String get reset_password_confirm_password_hint_text {
    return Intl.message(
      'confirm password',
      name: 'reset_password_confirm_password_hint_text',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get reset_password_button {
    return Intl.message(
      'Reset Password',
      name: 'reset_password_button',
      desc: '',
      args: [],
    );
  }

  /// `Password reset \nsuccessfully`
  String get successful_reset_password_title1 {
    return Intl.message(
      'Password reset \nsuccessfully',
      name: 'successful_reset_password_title1',
      desc: '',
      args: [],
    );
  }

  /// `You have successfully change your \npassword. please use your new \npassword to login`
  String get successful_reset_password_title2 {
    return Intl.message(
      'You have successfully change your \npassword. please use your new \npassword to login',
      name: 'successful_reset_password_title2',
      desc: '',
      args: [],
    );
  }

  /// `Go to login`
  String get successful_reset_password_button {
    return Intl.message(
      'Go to login',
      name: 'successful_reset_password_button',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get bottom_nav_bar_title1 {
    return Intl.message(
      'Home',
      name: 'bottom_nav_bar_title1',
      desc: '',
      args: [],
    );
  }

  /// `Learn`
  String get bottom_nav_bar_title2 {
    return Intl.message(
      'Learn',
      name: 'bottom_nav_bar_title2',
      desc: '',
      args: [],
    );
  }

  /// `Community`
  String get bottom_nav_bar_title3 {
    return Intl.message(
      'Community',
      name: 'bottom_nav_bar_title3',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get bottom_nav_bar_title4 {
    return Intl.message(
      'Profile',
      name: 'bottom_nav_bar_title4',
      desc: '',
      args: [],
    );
  }

  /// `An `
  String get home_page_title1 {
    return Intl.message(
      'An ',
      name: 'home_page_title1',
      desc: '',
      args: [],
    );
  }

  /// `intelligent`
  String get home_page_title2 {
    return Intl.message(
      'intelligent',
      name: 'home_page_title2',
      desc: '',
      args: [],
    );
  }

  /// ` learning & work ecosystem.`
  String get home_page_title3 {
    return Intl.message(
      ' learning & work ecosystem.',
      name: 'home_page_title3',
      desc: '',
      args: [],
    );
  }

  /// `Syntra.Ai merges personalized education, team collaboration, and automated recruitment into one seamless verified workflow.`
  String get home_page_title4 {
    return Intl.message(
      'Syntra.Ai merges personalized education, team collaboration, and automated recruitment into one seamless verified workflow.',
      name: 'home_page_title4',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get home_page_button1 {
    return Intl.message(
      'Get Started',
      name: 'home_page_button1',
      desc: '',
      args: [],
    );
  }

  /// `View Tech Stack`
  String get home_page_button2 {
    return Intl.message(
      'View Tech Stack',
      name: 'home_page_button2',
      desc: '',
      args: [],
    );
  }

  /// `Our Features`
  String get home_page_title5 {
    return Intl.message(
      'Our Features',
      name: 'home_page_title5',
      desc: '',
      args: [],
    );
  }

  /// `Personalized AI Roadmaps`
  String get home_page_feature1 {
    return Intl.message(
      'Personalized AI Roadmaps',
      name: 'home_page_feature1',
      desc: '',
      args: [],
    );
  }

  /// `Auto-Generated CVs`
  String get home_page_feature2 {
    return Intl.message(
      'Auto-Generated CVs',
      name: 'home_page_feature2',
      desc: '',
      args: [],
    );
  }

  /// `Verified Project Data`
  String get home_page_feature3 {
    return Intl.message(
      'Verified Project Data',
      name: 'home_page_feature3',
      desc: '',
      args: [],
    );
  }

  /// `Direct Employer Hiring`
  String get home_page_feature4 {
    return Intl.message(
      'Direct Employer Hiring',
      name: 'home_page_feature4',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get profile_page_button1 {
    return Intl.message(
      'Logout',
      name: 'profile_page_button1',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get profile_page_title1 {
    return Intl.message(
      'Account',
      name: 'profile_page_title1',
      desc: '',
      args: [],
    );
  }

  /// `Your profile`
  String get profile_page_title2 {
    return Intl.message(
      'Your profile',
      name: 'profile_page_title2',
      desc: '',
      args: [],
    );
  }

  /// `Your details from the server. Update your photo anytime.`
  String get profile_page_title3 {
    return Intl.message(
      'Your details from the server. Update your photo anytime.',
      name: 'profile_page_title3',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get profile_page_title4 {
    return Intl.message(
      'Full Name',
      name: 'profile_page_title4',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get profile_page_title5 {
    return Intl.message(
      'Email',
      name: 'profile_page_title5',
      desc: '',
      args: [],
    );
  }

  /// `Role`
  String get profile_page_title6 {
    return Intl.message(
      'Role',
      name: 'profile_page_title6',
      desc: '',
      args: [],
    );
  }

  /// `GitHub`
  String get profile_page_title7 {
    return Intl.message(
      'GitHub',
      name: 'profile_page_title7',
      desc: '',
      args: [],
    );
  }

  /// `Not Linked`
  String get profile_page_title7_value {
    return Intl.message(
      'Not Linked',
      name: 'profile_page_title7_value',
      desc: '',
      args: [],
    );
  }

  /// `Email Verified`
  String get profile_page_title8 {
    return Intl.message(
      'Email Verified',
      name: 'profile_page_title8',
      desc: '',
      args: [],
    );
  }

  /// `Verified`
  String get profile_page_title8_value1 {
    return Intl.message(
      'Verified',
      name: 'profile_page_title8_value1',
      desc: '',
      args: [],
    );
  }

  /// `Not Verified`
  String get profile_page_title8_value2 {
    return Intl.message(
      'Not Verified',
      name: 'profile_page_title8_value2',
      desc: '',
      args: [],
    );
  }

  /// `Account Status`
  String get profile_page_title9 {
    return Intl.message(
      'Account Status',
      name: 'profile_page_title9',
      desc: '',
      args: [],
    );
  }

  /// `Active`
  String get profile_page_title9_value1 {
    return Intl.message(
      'Active',
      name: 'profile_page_title9_value1',
      desc: '',
      args: [],
    );
  }

  /// `Inactive`
  String get profile_page_title9_value2 {
    return Intl.message(
      'Inactive',
      name: 'profile_page_title9_value2',
      desc: '',
      args: [],
    );
  }

  /// `Member Since`
  String get profile_page_title10 {
    return Intl.message(
      'Member Since',
      name: 'profile_page_title10',
      desc: '',
      args: [],
    );
  }

  /// `Last Updated`
  String get profile_page_title11 {
    return Intl.message(
      'Last Updated',
      name: 'profile_page_title11',
      desc: '',
      args: [],
    );
  }

  /// `Change profile photo`
  String get profile_page_button2 {
    return Intl.message(
      'Change profile photo',
      name: 'profile_page_button2',
      desc: '',
      args: [],
    );
  }

  /// `Logging in...`
  String get loading_dialog_login {
    return Intl.message(
      'Logging in...',
      name: 'loading_dialog_login',
      desc: '',
      args: [],
    );
  }

  /// `Sending OTP...`
  String get loading_dialog_signup_forget_password {
    return Intl.message(
      'Sending OTP...',
      name: 'loading_dialog_signup_forget_password',
      desc: '',
      args: [],
    );
  }

  /// `Resending OTP...`
  String get loading_dialog_verify {
    return Intl.message(
      'Resending OTP...',
      name: 'loading_dialog_verify',
      desc: '',
      args: [],
    );
  }

  /// `Logging out...`
  String get loading_dialog_logout {
    return Intl.message(
      'Logging out...',
      name: 'loading_dialog_logout',
      desc: '',
      args: [],
    );
  }

  /// `Uploading profile image...`
  String get loading_dialog_upload_user_profile_image {
    return Intl.message(
      'Uploading profile image...',
      name: 'loading_dialog_upload_user_profile_image',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get app_toast_error {
    return Intl.message(
      'Error',
      name: 'app_toast_error',
      desc: '',
      args: [],
    );
  }

  /// `Theme Mode`
  String get theme_mode {
    return Intl.message(
      'Theme Mode',
      name: 'theme_mode',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get light_mode {
    return Intl.message(
      'Light',
      name: 'light_mode',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get dark_mode {
    return Intl.message(
      'Dark',
      name: 'dark_mode',
      desc: '',
      args: [],
    );
  }

  /// `System`
  String get system_mode {
    return Intl.message(
      'System',
      name: 'system_mode',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arabic {
    return Intl.message(
      'Arabic',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
