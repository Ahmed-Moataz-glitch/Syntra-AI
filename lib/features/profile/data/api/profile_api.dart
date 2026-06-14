import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:syntra_ai/core/utils/app_api.dart';
import 'package:syntra_ai/core/utils/secure_storage.dart';
import 'package:syntra_ai/features/auth/data/api/api_result.dart';
import 'package:syntra_ai/features/profile/data/model/logout_response_dto.dart';
import 'package:syntra_ai/features/profile/data/model/upload_user_profile_image_request_dto.dart';
import 'package:syntra_ai/features/profile/data/model/upload_user_profile_image_response_dto.dart';
import 'package:syntra_ai/features/profile/data/model/user_data_response_dto.dart';
import 'package:syntra_ai/features/profile/data/model/user_profile_model.dart';

class ProfileApi {
  final ImagePicker _imagePicker = ImagePicker();

  UserProfileModel? getUserProfile(String userId) {
    var userBox = Hive.box<UserProfileModel>(AppApi.userProfileBox);
    return userBox.get(userId);
  }

  Future<void> deleteUserProfile(String userId) async {
    var userBox = Hive.box<UserProfileModel>(AppApi.userProfileBox);
    await userBox.delete(userId);
  }

  Future<String?> pickUserProfileImage() async {
    final userProfileImage = await _imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    return userProfileImage?.path;
  }

  Future<ApiResult<UploadUserProfileImageResponseDto>> uploadUserProfileImage(
    UploadUserProfileImageRequestDto uploadUserProfileImageRequestDto,
  ) async {
    final token = await SecureStorage.getToken();
    var url = Uri.https(
      AppApi.authHost,
      AppApi.baseUrl + AppApi.uploadUserProfileImageEndpoint,
    );
    try {
      var request = http.MultipartRequest('POST', url);
      request.files.add(
        await http.MultipartFile.fromPath(
          'image',
          uploadUserProfileImageRequestDto.image ?? '',
        ),
      );
      request.headers.addAll({
        'Authorization': 'Bearer $token',
      });
      var response = await request.send();
      var responseBody = await response.stream.bytesToString();
      var json = jsonDecode(responseBody);
      if (response.statusCode == 200) {
        return ApiSuccess<UploadUserProfileImageResponseDto>(
          UploadUserProfileImageResponseDto.fromJson(json),
        );
      } else {
        return ApiError<UploadUserProfileImageResponseDto>(
          'HTTP ${response.statusCode}: $responseBody',
        );
      }
    } catch (e) {
      return ApiError<UploadUserProfileImageResponseDto>(e.toString());
    }
  }

  Future<ApiResult<UserDataResponseDto>> fetchUserData() async {
    final token = await SecureStorage.getToken();
    var url =
        Uri.https(AppApi.authHost, AppApi.baseUrl + AppApi.userDataEndpoint);
    try {
      var response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $token'},
      );
      if (response.statusCode != 200) {
        return ApiError<UserDataResponseDto>(
          'HTTP ${response.statusCode}: ${response.body}',
        );
      }
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return ApiSuccess<UserDataResponseDto>(
        UserDataResponseDto.fromJson(json),
      );
    } catch (e) {
      return ApiError<UserDataResponseDto>(e.toString());
    }
  }

  Future<ApiResult<LogoutResponseDto>> logout(String userId) async {
    final token = await SecureStorage.getToken();
    var url =
        Uri.https(AppApi.authHost, AppApi.baseUrl + AppApi.logoutEndpoint);
    try {
      var response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $token'},
      );
      if (response.statusCode != 200) {
        return ApiError<LogoutResponseDto>(
          'HTTP ${response.statusCode}: ${response.body}',
        );
      }
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      await SecureStorage.deleteToken();
      await deleteUserProfile(userId);
      return ApiSuccess<LogoutResponseDto>(LogoutResponseDto.fromJson(json));
    } catch (e) {
      return ApiError<LogoutResponseDto>(e.toString());
    }
  }
}
