import 'package:dio/dio.dart';

String handleDioError(DioException error) {
  String errorDescription = "";

  switch (error.type) {
    case DioExceptionType.cancel:
      errorDescription = "Request to API server was cancelled";
      break;
    case DioExceptionType.connectionTimeout:
      errorDescription = "Connection timeout with API server";
      break;
    case DioExceptionType.receiveTimeout:
      errorDescription = "Receive timeout in connection with API server";
      break;
    case DioExceptionType.badResponse:
      errorDescription = "Receive a bad response from the API server";
    case DioExceptionType.sendTimeout:
      errorDescription = "Send timeout in connection with API server";
      break;
    case DioExceptionType.badCertificate:
      errorDescription = "Bad certificate";
      break;
    case DioExceptionType.connectionError:
      errorDescription = "Internet Connection Problem.";
      break;
    case DioExceptionType.unknown:
      errorDescription = "Unkown error";
      break;
  }

  return errorDescription;
}
