import 'package:syntra_ai/features/learn/data/api/api_result.dart';
import 'package:syntra_ai/features/learn/domain/entities/evaluation_result_response_entity.dart';
import 'package:syntra_ai/features/learn/domain/repo/repo/learn_repo.dart';

class EvaluationResultUseCase {
  final LearnRepo learnRepo;
  EvaluationResultUseCase(this.learnRepo);

  Future<ApiResult<EvaluationResultResponseEntity>> call(String studentId) {
    return learnRepo.getEvaluationResult(studentId);
  }
}
