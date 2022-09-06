// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:video_streaming_app/data/network/error_handler.dart';
import 'package:video_streaming_app/data/network/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:video_streaming_app/data/network/networkClient.dart';
import 'package:video_streaming_app/data/network/networkInfo.dart';
import 'package:video_streaming_app/domain/models/fecth_movie_model.dart';
import 'package:video_streaming_app/domain/repository/home_repository.dart';
import 'package:video_streaming_app/data/mappers/mappers.dart';

class HomeRepositoryImplementor implements HomeRepository {
  NetworkClient networkClient;
  NetWorkInfoChecker netWorkInfoChecker;
  HomeRepositoryImplementor({
    required this.networkClient,
    required this.netWorkInfoChecker,
  });

  @override
  Future<Either<Failure, FecthMovieModel>> fecthMovies() async {
    if (await netWorkInfoChecker.isConnected) {
      try {
        return Right((await networkClient.fecthMovie()).toDomain());
      } catch (error) {
        return Left(ErrorHandler(error).handle());
      }
    } else {
      return Left(Errors.Unknown.getResponse());
    }
  }
}
