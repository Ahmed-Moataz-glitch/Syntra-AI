// ignore_for_file: unused_field

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syntra_ai/features/learn/domain/repo/repo/learn_repo.dart';

part 'learn_state.dart';

class LearnCubit extends Cubit<LearnState> {
  final LearnRepo _learnRepo;
  LearnCubit(this._learnRepo) : super(LearnInitial());

  
}
