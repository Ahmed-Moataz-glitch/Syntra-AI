import 'package:syntra_ai/features/learn/data/api/api_result.dart';
import 'package:syntra_ai/features/learn/domain/entities/generate_roadmap_request_entity.dart';
import 'package:syntra_ai/features/learn/domain/entities/generate_roadmap_response_entity.dart';
import 'package:syntra_ai/features/learn/domain/repo/repo/learn_repo.dart';

class GenerateRoadmapUseCase {
  final LearnRepo learnRepo;

  GenerateRoadmapUseCase(this.learnRepo);

  Future<ApiResult<GenerateRoadmapResponseEntity>> call(GenerateRoadmapRequestEntity generateRoadmapRequestEntity) {
    return learnRepo.generateRoadmap(generateRoadmapRequestEntity);
  }
}