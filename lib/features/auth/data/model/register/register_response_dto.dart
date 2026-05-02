import 'package:syntra_ai/features/auth/domain/entities/register/register_response_entity.dart';

class RegisterResponseDto {
  bool? success;
  String? message;

  RegisterResponseDto({this.success, this.message});

  RegisterResponseDto.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
  }

  RegisterResponseEntity toEntity() {
    return RegisterResponseEntity(
      success: success ?? false,
      message: message ?? '',
    );
  }
}
