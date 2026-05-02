import 'package:syntra_ai/features/profile/domain/entities/upload_user_profile_image_request_entity.dart';

class UploadUserProfileImageRequestDto {
  String? image;

  UploadUserProfileImageRequestDto({this.image});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    return data;
  }

  UploadUserProfileImageRequestEntity toEntity() {
    return UploadUserProfileImageRequestEntity(
      image: image ?? '',
    );
  }
}
