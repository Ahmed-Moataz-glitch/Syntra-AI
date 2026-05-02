// ignore_for_file: unused_field

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syntra_ai/features/community/domain/repo/repo/community_repo.dart';

part 'community_state.dart';

class CommunityCubit extends Cubit<CommunityState> {
  final CommunityRepo _communityRepo;
  CommunityCubit(this._communityRepo) : super(CommunityInitial());

  
}
