import 'package:syntra_ai/features/community/data/api/api_result.dart';
import 'package:syntra_ai/features/community/domain/entities/start_interview_request_entity.dart';
import 'package:syntra_ai/features/community/domain/entities/start_interview_response_entity.dart';
import 'package:syntra_ai/features/community/domain/repo/repo/community_repo.dart';

class StartInterviewUseCase {
  final CommunityRepo _communityRepo;
  StartInterviewUseCase(this._communityRepo);

  Future<ApiResult<StartInterviewResponseEntity>> call(StartInterviewRequestEntity startInterviewRequestEntity) {
    return _communityRepo.startInterview(startInterviewRequestEntity);
  }
}