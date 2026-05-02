class UploadUserProfileImageResponseEntity {
  String message;
  UserProfileEntity user;

  UploadUserProfileImageResponseEntity({this.message = '', this.user = const UserProfileEntity(id: '', avatar: '', imageUrl: '')});
}

class UserProfileEntity {
  final String id;
  final String avatar;
  final String imageUrl;

  const UserProfileEntity({this.id = '', this.avatar = '', required this.imageUrl});
}
