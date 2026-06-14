// ignore_for_file: unused_field
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syntra_ai/features/community/data/api/api_result.dart';
import 'package:syntra_ai/features/community/domain/entities/get_users_finished_tracks_response_entity.dart';
import 'package:syntra_ai/features/community/domain/use_case/get_users_finished_tracks_use_case.dart';

part 'community_state.dart';

class CommunityCubit extends Cubit<CommunityState> {
  final GetUsersFinishedTracksUseCase getUsersFinishedTracksUseCase;
  CommunityCubit({
    required this.getUsersFinishedTracksUseCase,
  }) : super(CommunityInitial());

  Future<void> getUsersFinishedTracks() async {
    emit(GetUsersFinishedTracksLoading());
    try {
      final result = await getUsersFinishedTracksUseCase.call();
      switch (result) {
        case ApiSuccess<GetUsersFinishedTracksResponseEntity>():
          emit(GetUsersFinishedTracksSuccess(result.data!));
          break;
        case ApiError<GetUsersFinishedTracksResponseEntity>():
          emit(GetUsersFinishedTracksError(result.message));
          break;
      }
    } catch (e) {
      emit(GetUsersFinishedTracksError(e.toString()));
    }
  }
}
