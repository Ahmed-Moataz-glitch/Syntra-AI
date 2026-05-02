// ignore_for_file: unused_field

import 'package:syntra_ai/features/home/domain/repo/data_source/home_data_source.dart';
import 'package:syntra_ai/features/home/domain/repo/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeDataSource _homeDataSource;
  HomeRepoImpl(this._homeDataSource);
  

}