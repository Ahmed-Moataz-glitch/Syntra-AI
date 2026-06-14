import 'package:syntra_ai/features/learn/data/api/api_result.dart';
import 'package:syntra_ai/features/learn/domain/entities/evaluate_project_request_entity.dart';
import 'package:syntra_ai/features/learn/domain/entities/evaluate_project_response_entity.dart';
import 'package:syntra_ai/features/learn/domain/repo/repo/learn_repo.dart';

class EvaluateProjectUseCase {
  final LearnRepo learnRepo;

  EvaluateProjectUseCase(this.learnRepo);

  Future<ApiResult<EvaluateProjectResponseEntity>> call(
      EvaluateProjectRequestEntity evaluateProjectRequestEntity) {
    return learnRepo.evaluateProject(evaluateProjectRequestEntity);
  }
}