import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:video_streaming_app/data/network/dio_factory.dart';
import 'package:video_streaming_app/data/network/networkClient.dart';
import 'package:video_streaming_app/data/network/networkInfo.dart';
import 'package:video_streaming_app/data/repository_impl/home_repository_impl.dart';
import 'package:video_streaming_app/domain/usecase/usecases.dart';

final instance = GetIt.instance;

intialize() async {
  final InternetConnectionChecker internetConnectionChecker =
      InternetConnectionChecker();
  instance.registerLazySingleton<NetWorkInfoChecker>(
      () => NetWorkInfoChecker(connectivityChecker: internetConnectionChecker));
  instance.registerLazySingleton<Dio>(() => DioFactory().getDio());
  instance.registerLazySingleton<NetworkClient>(
      () => NetworkClient(dio: instance()));
  instance.registerLazySingleton<HomeRepositoryImplementor>(() =>
      HomeRepositoryImplementor(
          networkClient: instance(), netWorkInfoChecker: instance()));
  instance.registerLazySingleton<HomePageUseCase>(
      () => HomePageUseCase(homeRepositoryImplementor: instance()));
}
