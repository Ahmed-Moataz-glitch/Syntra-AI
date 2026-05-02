import 'package:syntra_ai/features/profile/domain/entities/logout_response_entity.dart';

class LogoutResponseDto {
  bool? success;
  String? message;

  LogoutResponseDto({this.success, this.message});

  LogoutResponseDto.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
  }

  LogoutResponseEntity toEntity() {
    return LogoutResponseEntity(
      success: success ?? false,
      message: message ?? '',
    );
  }
}
