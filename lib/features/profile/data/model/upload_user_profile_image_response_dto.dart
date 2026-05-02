import 'package:syntra_ai/features/profile/domain/entities/upload_user_profile_image_response_entity.dart';

class UploadUserProfileImageResponseDto {
  String? message;
  User? user;

  UploadUserProfileImageResponseDto({this.message, this.user});

  UploadUserProfileImageResponseDto.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  UploadUserProfileImageResponseEntity toEntity() {
    return UploadUserProfileImageResponseEntity(
      message: message ?? '',
      user: UserProfileEntity(
        id: user?.id ?? '',
        avatar: user?.avatar ?? '',
        imageUrl: user?.imageUrl ?? '',
      ),
    );
  }
}

class User {
  String? id;
  String? avatar;
  String? imageUrl;

  User({this.id, this.avatar, this.imageUrl});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    avatar = json['avatar'];
    imageUrl = json['imageUrl'];
  }

  UserProfileEntity toEntity() {
    return UserProfileEntity(
      id: id ?? '',
      avatar: avatar ?? '',
      imageUrl: imageUrl ?? '',
    );
  }
}
