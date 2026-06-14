import 'package:syntra_ai/features/learn/data/api/api_result.dart';
import 'package:syntra_ai/features/learn/domain/entities/generate_and_assign_request_entity.dart';
import 'package:syntra_ai/features/learn/domain/entities/generate_and_assign_response_entity.dart';
import 'package:syntra_ai/features/learn/domain/repo/repo/learn_repo.dart';

class GenerateAndAssignUseCase {
  final LearnRepo learnRepo;
  GenerateAndAssignUseCase(this.learnRepo);

  Future<ApiResult<GenerateAndAssignResponseEntity>> call(GenerateAndAssignRequestEntity generateAndAssignRequestEntity) {
    return learnRepo.generateAndAssign(generateAndAssignRequestEntity);
  }
}