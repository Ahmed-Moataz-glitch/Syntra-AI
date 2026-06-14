import 'package:syntra_ai/features/auth/domain/entities/login/forget_password_response_entity.dart';

class ForgetPasswordResponseDto {
  bool? success;
  String? message;

  ForgetPasswordResponseDto({this.success, this.message});

  ForgetPasswordResponseDto.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
  }

  ForgetPasswordResponseEntity toEntity() {
    return ForgetPasswordResponseEntity(
      success: success ?? false,
      message: message ?? '',
    );
  }
}
