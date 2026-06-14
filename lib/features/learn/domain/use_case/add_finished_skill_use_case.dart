import 'package:syntra_ai/features/learn/data/api/api_result.dart';
import 'package:syntra_ai/features/learn/domain/entities/add_finished_skill_request_entity.dart';
import 'package:syntra_ai/features/learn/domain/entities/add_finished_skill_response_entity.dart';
import 'package:syntra_ai/features/learn/domain/repo/repo/learn_repo.dart';

class AddFinishedSkillUseCase {
  final LearnRepo learnRepo;
  AddFinishedSkillUseCase(this.learnRepo);

  Future<ApiResult<AddFinishedSkillResponseEntity>> call(
      AddFinishedSkillRequestEntity addFinishedSkillRequestEntity) {
    return learnRepo.addFinishedSkill(addFinishedSkillRequestEntity);
  }
}
