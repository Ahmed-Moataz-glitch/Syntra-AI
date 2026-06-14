import 'package:syntra_ai/features/learn/data/api/api_result.dart';
import 'package:syntra_ai/features/learn/domain/entities/set_team_request_entity.dart';
import 'package:syntra_ai/features/learn/domain/repo/repo/learn_repo.dart';

class SetTeamUseCase {
  final LearnRepo learnRepo;
  SetTeamUseCase(this.learnRepo);

  Future<ApiResult<void>> call(List<SetTeamRequestEntity> teamMembers) {
    return learnRepo.setTeam(teamMembers);
  }
}