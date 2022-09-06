import 'package:dartz/dartz.dart';
import 'package:video_streaming_app/data/network/failure.dart';
import 'package:video_streaming_app/domain/models/fecth_movie_model.dart';
import 'package:video_streaming_app/domain/models/movie_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, FecthMovieModel>> fecthMovies();
}
