import 'package:syntra_ai/features/community/data/api/api_result.dart';
import 'package:syntra_ai/features/community/domain/entities/interview_chat_request_entity.dart';
import 'package:syntra_ai/features/community/domain/entities/interview_chat_response_entity.dart';
import 'package:syntra_ai/features/community/domain/repo/repo/community_repo.dart';

class InterviewChatUseCase {
  final CommunityRepo _communityRepo;
  InterviewChatUseCase(this._communityRepo);

  Future<ApiResult<InterviewChatResponseEntity>> call(InterviewChatRequestEntity interviewChatRequestEntity) {
    return _communityRepo.interviewChat(interviewChatRequestEntity);
  }
}