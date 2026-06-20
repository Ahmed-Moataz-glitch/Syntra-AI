import 'package:syntra_ai/features/community/data/api/api_result.dart';
import 'package:syntra_ai/features/community/domain/entities/end_interview_response_entity.dart';
import 'package:syntra_ai/features/community/domain/repo/repo/community_repo.dart';

class EndInterviewUseCase {
  final CommunityRepo _communityRepo;
  EndInterviewUseCase(this._communityRepo);

  Future<ApiResult<EndInterviewResponseEntity>> call(String sessionId) {
    return _communityRepo.endInterview(sessionId);
  }
}
