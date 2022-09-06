import 'package:video_streaming_app/data/responses/fecth_movie_resp.dart';
import 'package:video_streaming_app/domain/models/fecth_movie_model.dart';
import 'package:video_streaming_app/domain/models/movie_model.dart';
import 'package:video_streaming_app/app/extensions.dart';

extension FecthMovieMapper on FecthMovieResponse {
  FecthMovieModel toDomain() {
    return FecthMovieModel(
        status: this.status.orZero(),
        videos: this.videos!.map((movie) => movie.toDomain()).toList());
  }
}

extension MovieMapper on MovieResponse? {
  MovieModel toDomain() {
    return MovieModel(
        video_id: this!.video_id.orEmpty(),
        title: this!.title.orEmpty(),
        description: this!.description.orEmpty(),
        banner: this!.banner.orEmpty(),
        sponsor: this!.sponsor.orEmpty(),
        file_upload: this!.file_upload.orEmpty());
  }
}
