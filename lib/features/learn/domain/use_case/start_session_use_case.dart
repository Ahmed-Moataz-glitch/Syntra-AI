import 'package:syntra_ai/features/learn/data/api/api_result.dart';
import 'package:syntra_ai/features/learn/domain/entities/start_session_response_entity.dart';
import 'package:syntra_ai/features/learn/domain/repo/repo/learn_repo.dart';

class StartSessionUseCase {
  final LearnRepo learnRepo;
  StartSessionUseCase(this.learnRepo);

  Future<ApiResult<StartSessionResponseEntity>> call() async {
    return learnRepo.startSession();
  }
}