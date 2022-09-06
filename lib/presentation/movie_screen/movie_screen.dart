import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:video_player/video_player.dart';
import 'package:video_streaming_app/domain/models/movie_model.dart';

class MovieScreen extends StatefulWidget {
  MovieModel movie;
  MovieScreen({Key? key, required this.movie}) : super(key: key);

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  late FlickManager flickManager;
  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController:
          VideoPlayerController.network(widget.movie.file_upload),
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movie.title),
        elevation: 0,
        backgroundColor: Colors.purple,
        automaticallyImplyLeading: true,
      ),
      body: FlickVideoPlayer(flickManager: flickManager),
    );
  }
}
