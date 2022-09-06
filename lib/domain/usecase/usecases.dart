// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:video_streaming_app/data/network/failure.dart';
import 'package:video_streaming_app/data/repository_impl/home_repository_impl.dart';
import 'package:video_streaming_app/domain/models/fecth_movie_model.dart';

abstract class BaseUseCase<In, Out> {
  Future<Either<Failure, Out>> excute(In input);
}

class HomePageUseCase implements BaseUseCase<void, FecthMovieModel> {
  HomeRepositoryImplementor homeRepositoryImplementor;
  HomePageUseCase({
    required this.homeRepositoryImplementor,
  });

  @override
  Future<Either<Failure, FecthMovieModel>> excute(void input) {
    return homeRepositoryImplementor.fecthMovies();
  }
}
