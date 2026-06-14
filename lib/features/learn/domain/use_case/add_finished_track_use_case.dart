import 'package:syntra_ai/features/learn/data/api/api_result.dart';
import 'package:syntra_ai/features/learn/domain/entities/add_finished_track_request_entity.dart';
import 'package:syntra_ai/features/learn/domain/entities/add_finished_track_response_entity.dart';
import 'package:syntra_ai/features/learn/domain/repo/repo/learn_repo.dart';

class AddFinishedTrackUseCase {
  final LearnRepo learnRepo;

  AddFinishedTrackUseCase(this.learnRepo);

  Future<ApiResult<AddFinishedTrackResponseEntity>> call(
      AddFinishedTrackRequestEntity addFinishedTrackRequestEntity) {
    return learnRepo.addFinishedTrack(addFinishedTrackRequestEntity);
  }
}