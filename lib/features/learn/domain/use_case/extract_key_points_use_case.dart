import 'package:syntra_ai/features/learn/data/api/api_result.dart';
import 'package:syntra_ai/features/learn/domain/entities/extract_key_points_request_entity.dart';
import 'package:syntra_ai/features/learn/domain/entities/extract_key_points_response_entity.dart';
import 'package:syntra_ai/features/learn/domain/repo/repo/learn_repo.dart';

class ExtractKeyPointsUseCase {
  final LearnRepo learnRepo;
  ExtractKeyPointsUseCase(this.learnRepo);

  Future<ApiResult<ExtractKeyPointsResponseEntity>> call(ExtractKeyPointsRequestEntity extractKeyPointsRequestEntity) async {
    return learnRepo.extractKeyPoints(extractKeyPointsRequestEntity);
  }
}