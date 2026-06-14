import 'dart:convert';
// import 'package:firebase_auth/firebase_auth.dart' hide User;
// import 'package:flutter/material.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:hive/hive.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:syntra_ai/core/utils/app_api.dart';
import 'package:syntra_ai/core/utils/secure_storage.dart';
import 'package:syntra_ai/features/auth/data/api/api_result.dart';
import 'package:syntra_ai/features/auth/data/model/login/forget_password_request_dto.dart';
import 'package:syntra_ai/features/auth/data/model/login/forget_password_response_dto.dart';
import 'package:syntra_ai/features/auth/data/model/login/login_request_dto.dart';
import 'package:syntra_ai/features/auth/data/model/login/login_response_dto.dart';
import 'package:syntra_ai/features/auth/data/model/login/reset_password_request_dto.dart';
import 'package:syntra_ai/features/auth/data/model/login/reset_password_response_dto.dart';
import 'package:syntra_ai/features/auth/data/model/register/register_request_dto.dart';
import 'package:syntra_ai/features/auth/data/model/register/register_response_dto.dart';
import 'package:syntra_ai/features/profile/data/model/user_profile_model.dart';

class AuthApi {
  // final _firebaseAuth = FirebaseAuth.instance;
  final supabase = Supabase.instance.client;

  Future<void> saveUserProfile(UserProfileModel userProfileModel) async {
    var userBox = Hive.box<UserProfileModel>(AppApi.userProfileBox);
    await userBox.put(userProfileModel.id, userProfileModel);
  }

  Future<ApiResult<LoginResponseDto>> loginWithEmailAndPassword(
    LoginRequestDto loginRequestDto,
  ) async {
    var url = Uri.https(AppApi.authHost, AppApi.baseUrl + AppApi.loginEndpoint);

    try {
      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(loginRequestDto.toJson()),
      );
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      if (response.statusCode != 200) {
        return ApiError<LoginResponseDto>(
          'HTTP ${response.statusCode}: $responseBody',
        );
      }
      await SecureStorage.saveToken(json['token'] ?? '');
      // final userDataResponseDto = UserDataResponseDto();
      // await HiveServices.saveUserData(userDataResponseDto);
      return ApiSuccess<LoginResponseDto>(LoginResponseDto.fromJson(json));
    } catch (e) {
      return ApiError<LoginResponseDto>(e.toString());
    }
  }

  Future<ApiResult<RegisterResponseDto>> register(
    RegisterRequestDto registerRequestDto,
  ) async {
    var url =
        Uri.https(AppApi.authHost, AppApi.baseUrl + AppApi.registerEndpoint);

    try {
      var response = await http.post(
        url, 
        body: registerRequestDto.toJson(),
      );
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      if (response.statusCode != 200) {
        return ApiError<RegisterResponseDto>(
          'HTTP ${response.statusCode}: $responseBody',
        );
      }
      return ApiSuccess<RegisterResponseDto>(
        RegisterResponseDto.fromJson(json),
      );
    } catch (e) {
      return ApiError<RegisterResponseDto>(e.toString());
    }
  }

  Future<bool> loginWithGoogle() async {
    // try {
    //   final gUser = await GoogleSignIn().signIn();
    //   final gAuth = await gUser?.authentication;
    //   final credential = GoogleAuthProvider.credential(
    //     accessToken: gAuth?.accessToken,
    //     idToken: gAuth?.idToken,
    //   );
    //   await SecureStorage.saveToken(gAuth?.idToken ?? '');
    //   final userCredential = await _firebaseAuth.signInWithCredential(
    //     credential,
    //   );
    //   return userCredential.user != null;
    // } catch (_) {
    //   return false;
    // }
    var url = 'https://${AppApi.authHost}${AppApi.baseUrl}${AppApi.googleEndpoint}';
    try {
      final result = await FlutterWebAuth2.authenticate(
        url: url,
        callbackUrlScheme: 'syntra-ai',
      );
      final uri = Uri.parse(result);
      final token = uri.queryParameters['token'] ?? '';
      await SecureStorage.saveToken(token);
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<bool> loginWithGitHub(/*BuildContext context*/) async {
    // final GitHubSignIn githubSignIn = GitHubSignIn(
    //   clientId: 'Ov23lisne7oJ1ewsE0jT',
    //   clientSecret: '92f2d38d457c01c3596585ab7dfc395dc2b28a04',
    //   redirectUrl: 'https://syntra-ai-c02e5.firebaseapp.com/__/auth/handler',
    // );
    // final result = await githubSignIn.signIn(context);
    // if (result.status == GitHubSignInResultStatus.ok) {
    //   return true;
    // } else {
    //   return false;
    // }
    var url =
        'https://${AppApi.authHost}${AppApi.baseUrl}${AppApi.gitHubEndpoint}';
    try {
      final result = await FlutterWebAuth2.authenticate(
        url: url,
        callbackUrlScheme: 'syntra-ai',
      );
      final uri = Uri.parse(result);
      final token = uri.queryParameters['token'] ?? '';
      await SecureStorage.saveToken(token);
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<ApiResult<ForgetPasswordResponseDto>> forgetPassword(
    ForgetPasswordRequestDto forgetPasswordRequestDto,
  ) async {
    var url = Uri.https(
      AppApi.authHost,
      AppApi.baseUrl + AppApi.forgetPasswordEndpoint,
    );
    try {
      var response = await http.post(
        url,
        body: forgetPasswordRequestDto.toJson(),
      );
      var responseBody = response.body;
      if (response.statusCode != 200) {
        return ApiError<ForgetPasswordResponseDto>(
          'HTTP ${response.statusCode}: $responseBody',
        );
      }
      var json = jsonDecode(responseBody);
      return ApiSuccess<ForgetPasswordResponseDto>(
        ForgetPasswordResponseDto.fromJson(json),
      );
    } catch (e) {
      return ApiError<ForgetPasswordResponseDto>(e.toString());
    }
  }

  Future<void> sendOtpForNewUser(String email) async {
    try {
      await supabase.auth.signInWithOtp(
        email: email,
        shouldCreateUser: true,
      );
    } catch (e) {
      throw 'Error from send OTP for new user: $e';
    }
  }

  Future<void> sendOtpForExistingUser(String email) async {
    try {
      await supabase.auth.signInWithOtp(
        email: email,
        shouldCreateUser: false,
      );
    } catch (e) {
      throw 'Error from send OTP for existing user: $e';
    }
  }

  Future<bool> validateOtp({required String email, required String otp}) async {
    try {
      final result = await supabase.auth.verifyOTP(
        type: OtpType.email,
        email: email,
        token: otp,
      );
      return result.session != null;
    } catch (e) {
      throw 'Error from validate OTP: $e';
    }
  }

  Future<ApiResult<ResetPasswordResponseDto>> resetPassword(
    ResetPasswordRequestDto resetPasswordRequestDto,
  ) async {
    var url = Uri.https(
      AppApi.authHost,
      AppApi.baseUrl + AppApi.resetPasswordEndpoint,
    );

    try {
      var response = await http.post(
        url,
        body: resetPasswordRequestDto.toJson(),
      );
      var responseBody = response.body;
      if(response.statusCode != 200) {
        return ApiError<ResetPasswordResponseDto>(
          'HTTP ${response.statusCode}: $responseBody',
        );
      }
      var json = jsonDecode(responseBody);
      return ApiSuccess<ResetPasswordResponseDto>(
        ResetPasswordResponseDto.fromJson(json),
      );
    } catch (e) {
      return ApiError<ResetPasswordResponseDto>(e.toString());
    }
  }
}
