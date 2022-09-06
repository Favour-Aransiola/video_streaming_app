import 'dart:async';

import 'package:video_streaming_app/domain/models/fecth_movie_model.dart';
import 'package:video_streaming_app/domain/models/movie_model.dart';
import 'package:video_streaming_app/domain/usecase/usecases.dart';
import 'package:video_streaming_app/presentation/base/base_viewmodel.dart';

enum PageState { Loading, Error, Content }

class HomeViewModel extends BaseViewModel
    with HomeViewModelInput, HomeViewModelOutput {
  HomePageUseCase homePageUseCase;
  HomeViewModel(this.homePageUseCase);
  late final StreamController<PageState> pageController;
  late final StreamController<List<MovieModel>> pageContentController;

  @override
  dispose() {
    pageController.done;
    pageContentController.done;
  }

  @override
  start() {
    pageController = StreamController.broadcast();
    pageContentController = StreamController.broadcast();

    fecthMovie();
    pageStateInput.add(PageState.Loading);
    // pageContentInput.add(null);
  }

  fecthMovie() async {
    (await homePageUseCase.excute(null)).fold((error) {
      {
        pageStateInput.add(PageState.Error);
      }
    }, (sucess) {
      pageStateInput.add(PageState.Content);
      pageContentInput.add(sucess.videos);
    });
  }

  @override
  // TODO: implement pageContentInput
  Sink get pageContentInput => pageContentController.sink;

  @override
  // TODO: implement pageContentOutput
  Stream<List<MovieModel>> get pageContentOutput {
    return pageContentController.stream.map((event) => event);
  }

  @override
  // TODO: implement pageStateInput
  Sink get pageStateInput => pageController.sink;

  @override
  // TODO: implement pageStateOutput
  Stream<PageState> get pageStateOutput => pageController.stream;
}

abstract class HomeViewModelInput {
  Sink get pageStateInput;
  Sink get pageContentInput;
}

abstract class HomeViewModelOutput {
  Stream<PageState> get pageStateOutput;
  Stream<List<MovieModel>> get pageContentOutput;
}
