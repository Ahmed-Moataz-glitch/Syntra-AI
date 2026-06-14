import 'package:syntra_ai/features/learn/data/api/api_result.dart';
import 'package:syntra_ai/features/learn/domain/entities/recommended_projects_request_entity.dart';
import 'package:syntra_ai/features/learn/domain/entities/recommended_projects_response_entity.dart';
import 'package:syntra_ai/features/learn/domain/repo/repo/learn_repo.dart';

class RecommendedProjectsUseCase {
  final LearnRepo learnRepo;
  RecommendedProjectsUseCase(this.learnRepo);

  Future<ApiResult<RecommendedProjectsResponseEntity>> call(
      RecommendedProjectsRequestEntity recommendedProjectsRequestEntity) {
    return learnRepo.recommendedProjects(recommendedProjectsRequestEntity);
  }
}
