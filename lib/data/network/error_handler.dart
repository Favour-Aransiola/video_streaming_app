import 'package:dio/dio.dart';
import 'package:video_streaming_app/data/network/failure.dart';

enum Errors { Timeout, BadRequest, NoInternetConnection, Unknown }

class ErrorHandler implements Exception {
  dynamic error;
  ErrorHandler(this.error);

  Failure handle() {
    if (error is DioError) {
      switch (error.type) {
        case DioErrorType.connectTimeout:
          return Errors.Timeout.getResponse();
        case DioErrorType.sendTimeout:
          return Errors.Timeout.getResponse();
          break;
        case DioErrorType.receiveTimeout:
          return Errors.Timeout.getResponse();
          break;
        case DioErrorType.response:
          return Errors.Unknown.getResponse();
          break;
        case DioErrorType.cancel:
          return Errors.BadRequest.getResponse();
          break;
        case DioErrorType.other:
          return Errors.Unknown.getResponse();
        default:
          return Errors.Unknown.getResponse();
      }
    } else {
      return Errors.Unknown.getResponse();
    }
  }
}

extension ErrorsResponse on Errors {
  Failure getResponse() {
    switch (this) {
      case Errors.Timeout:
        return Failure(statusCode: 400, message: 'Connection Timeout');

      case Errors.BadRequest:
        return Failure(statusCode: 401, message: 'Bad Request');
      case Errors.NoInternetConnection:
        return Failure(statusCode: 403, message: 'No Internet Connection');
      case Errors.Unknown:
        return Failure(
            message: 'An Error Occured please try again', statusCode: -1);
        break;
    }
  }
}
