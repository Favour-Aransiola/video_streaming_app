// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:video_streaming_app/app/constants.dart';
import 'package:video_streaming_app/data/responses/fecth_movie_resp.dart';

class NetworkClient {
  Dio dio;
  NetworkClient({
    required this.dio,
  });
  Future<FecthMovieResponse> fecthMovie() async {
    final response = await dio.get(UrlContanst.FECTH_MOVIE);

    return FecthMovieResponse.fromJson(response.data);
  }
}
