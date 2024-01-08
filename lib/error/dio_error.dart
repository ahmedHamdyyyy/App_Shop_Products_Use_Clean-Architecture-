import 'package:dio/dio.dart';

class ApiExceptionHandler  {
  static String handle(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        return 'network connection error';
      case DioExceptionType.badCertificate:
        return 'bad certification';
      case DioExceptionType.badResponse:
        return _badResponseError(exception.response);
      case DioExceptionType.cancel:
        return 'request has been canceled';
      case DioExceptionType.connectionError:
        return 'connection error';
      case DioExceptionType.unknown:
        return 'unknown error';
    }
  }

  static String _badResponseError(Response? response) {
    if (response == null || response.statusCode == null) return 'unknown Error';
    switch (response.statusCode) {
      case 400:
        return 'bad request';
      case 401:
        return 'unauthorized';
      case 402:
        return 'Payment Required';
      case 403:
        return 'you hane no access rights to the content';
      case 404:
        return 'not found';  
        case 422:
        return ""/*ErrorMessageRegester.fromJson(response.data).detiles*/ ;
      case 500:
        return 'internal server error';
      case 503:
        return 'server not available';
      default:
        return 'unknown error';
    }
  }
}