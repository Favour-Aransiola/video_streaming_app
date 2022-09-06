// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:video_streaming_app/domain/models/movie_model.dart';

class FecthMovieModel {
  int status;
  List<MovieModel> videos;
  FecthMovieModel({
    required this.status,
    required this.videos,
  });

  FecthMovieModel copyWith({
    int? status,
    List<MovieModel>? videos,
  }) {
    return FecthMovieModel(
      status: status ?? this.status,
      videos: videos ?? this.videos,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'videos': videos.map((x) => x.toMap()).toList(),
    };
  }

  factory FecthMovieModel.fromMap(Map<String, dynamic> map) {
    return FecthMovieModel(
      status: map['status'] as int,
      videos: List<MovieModel>.from(
        (map['videos'] as List<int>).map<MovieModel>(
          (x) => MovieModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory FecthMovieModel.fromJson(String source) =>
      FecthMovieModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'FecthMovieModel(status: $status, videos: $videos)';

  @override
  bool operator ==(covariant FecthMovieModel other) {
    if (identical(this, other)) return true;

    return other.status == status && listEquals(other.videos, videos);
  }

  @override
  int get hashCode => status.hashCode ^ videos.hashCode;
}
