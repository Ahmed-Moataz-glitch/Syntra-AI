import 'package:syntra_ai/features/community/data/api/api_result.dart';
import 'package:syntra_ai/features/community/domain/entities/get_languages_response_entity.dart';
import 'package:syntra_ai/features/community/domain/repo/repo/community_repo.dart';

class GetLanguagesUseCase {
  final CommunityRepo _communityRepo;
  GetLanguagesUseCase(this._communityRepo);

  Future<ApiResult<GetLanguagesResponseEntity>> call() {
    return _communityRepo.getLanguages();
  }
}