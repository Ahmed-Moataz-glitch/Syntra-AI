import 'package:hive/hive.dart';

part 'user_profile_model.g.dart';

@HiveType(typeId: 0)
class UserProfileModel extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String email;
  @HiveField(3)
  final String role;
  @HiveField(4)
  final String githubId;
  @HiveField(5)
  final bool emailVerified;
  @HiveField(6)
  final bool isActive;
  @HiveField(7)
  final String createdAt;
  @HiveField(8)
  final String updatedAt;

  UserProfileModel({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.githubId,
    required this.emailVerified,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });
}