import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServce');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiServce');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServce');

      case DioExceptionType.badCertificate:
      //
      return ServerFailure('Incorrect Certificate');

      case DioExceptionType.badResponse:
        return ServerFailure.fromRespone(
            dioException.response!.statusCode!, dioException.response!.data);

      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServce was canceld');

      case DioExceptionType.connectionError:
      //
        return ServerFailure('No Internet Connection, please try later!');

      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unexpected Error, please try again!');
        default:
        retu
    }
  }

  factory ServerFailure.fromRespone(int statusCode, dynamic respone) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(respone['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal, please try later');
    } else {
      return ServerFailure('Opps There was an Error, please try again');
    }
  }
}
