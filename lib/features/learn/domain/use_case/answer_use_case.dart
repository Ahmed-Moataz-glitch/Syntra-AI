import 'package:syntra_ai/features/learn/data/api/api_result.dart';
import 'package:syntra_ai/features/learn/domain/entities/answer_request_entity.dart';
import 'package:syntra_ai/features/learn/domain/entities/answer_response_entity.dart';
import 'package:syntra_ai/features/learn/domain/repo/repo/learn_repo.dart';

class AnswerUseCase {
  final LearnRepo learnRepo;
  AnswerUseCase(this.learnRepo);

  Future<ApiResult<AnswerResponseEntity>> call(AnswerRequestEntity answerRequestEntity) async {
    return learnRepo.answer(answerRequestEntity);
  }
}