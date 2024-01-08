import 'package:dio/dio.dart';

 abstract class Failure  {
  final String messageError;
  const Failure({required this.messageError});

}





class ServerFailure extends Failure {
  ServerFailure({required super.messageError});
  factory ServerFailure.fromDioError(DioException e){
   switch(e.type){
     case DioExceptionType.connectionTimeout:
      return ServerFailure(messageError: "connection Timeout With Api Server");
     case DioExceptionType.sendTimeout:
      return ServerFailure(messageError: "send Time out With Api Server");
      case DioExceptionType.receiveTimeout:
       return ServerFailure(messageError: "receive Timeout With Api Server");
     case DioExceptionType.badCertificate:
    return ServerFailure(messageError: "bad Certificate With Api Server");
    case DioExceptionType.badResponse:
     return ServerFailure._fromResponse(e.response!.statusCode!, e.response!.data);

     case DioExceptionType.cancel:
    return ServerFailure(messageError: "cancel With Api Server");
     case DioExceptionType.connectionError:
      return ServerFailure(messageError: "  No Internet connection ");
     case DioExceptionType.unknown:
      return ServerFailure(messageError: " Opps there was an error unknown With Api Server");
   }
  }
  factory ServerFailure._fromResponse(int statusCode,  dynamic response){
    if (statusCode==404){
      return ServerFailure(messageError: "your request was not found ,please try again");
    }else if(statusCode==400 ||statusCode==401 ||statusCode==403 ){
      return ServerFailure(messageError: " Unauthorized ,please try again");
    }else if(statusCode==500){
      return ServerFailure(messageError: "There are problem in server ,please try again");
    }else {
      return ServerFailure(messageError: "There was an error ,please try again");
    }



  }
}

