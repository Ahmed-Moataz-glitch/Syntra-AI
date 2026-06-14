import 'package:syntra_ai/features/learn/data/api/api_result.dart';
import 'package:syntra_ai/features/learn/domain/entities/generate_quiz_request_entity.dart';
import 'package:syntra_ai/features/learn/domain/entities/generate_quiz_response_entity.dart';
import 'package:syntra_ai/features/learn/domain/repo/repo/learn_repo.dart';

class GenerateQuizUseCase {
  final LearnRepo learnRepo;
  GenerateQuizUseCase(this.learnRepo);

  Future<ApiResult<GenerateQuizResponseEntity>> call(
      GenerateQuizRequestEntity generateQuizRequestEntity) {
    return learnRepo.generateQuiz(generateQuizRequestEntity);
  }
}
