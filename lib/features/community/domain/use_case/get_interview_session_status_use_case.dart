import 'package:syntra_ai/features/community/data/api/api_result.dart';
import 'package:syntra_ai/features/community/domain/entities/get_interview_session_status_response_entity.dart';
import 'package:syntra_ai/features/community/domain/repo/repo/community_repo.dart';

class GetInterviewSessionStatusUseCase {
  final CommunityRepo _communityRepo;
  GetInterviewSessionStatusUseCase(this._communityRepo);

  Future<ApiResult<GetInterviewSessionStatusResponseEntity>> call(String sessionId) {
    return _communityRepo.getInterviewSessionStatus(sessionId);
  }
}