// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class FecthMovieResponse {
  int? status;
  List<MovieResponse>? videos;
  FecthMovieResponse({
    this.status,
    this.videos,
  });

  FecthMovieResponse copyWith({
    int? status,
    List<MovieResponse>? videos,
  }) {
    return FecthMovieResponse(
      status: status ?? this.status,
      videos: videos ?? this.videos,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'videos': videos?.map((x) => x.toMap()).toList(),
    };
  }

  factory FecthMovieResponse.fromMap(Map<String, dynamic> map) {
    return FecthMovieResponse(
      status: map['status'] != null ? map['status'] as int : null,
      videos: map['videos'] != null
          ? List<MovieResponse>.from(
              (map['videos'] as List<dynamic>).map<MovieResponse?>(
                (x) {
                  return MovieResponse.fromMap(x as Map<String, dynamic>);
                },
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory FecthMovieResponse.fromJson(String source) =>
      FecthMovieResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}

class MovieResponse {
  String? video_id;
  String? title;
  String? description;
  String? banner;
  String? sponsor;
  String? file_upload;

  MovieResponse({
    this.video_id,
    this.title,
    this.description,
    this.banner,
    this.sponsor,
    this.file_upload,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'video_id': video_id,
      'title': title,
      'description': description,
      'banner': banner,
      'sponsor': sponsor,
      'file_upload': file_upload,
    };
  }

  factory MovieResponse.fromMap(Map<String, dynamic> map) {
    return MovieResponse(
      video_id: map['video_id'] != null ? map['video_id'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      banner: map['banner'] != null ? map['banner'] as String : null,
      sponsor: map['sponsor'] != null ? map['sponsor'] as String : null,
      file_upload:
          map['file_upload'] != null ? map['file_upload'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieResponse.fromJson(String source) =>
      MovieResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}
