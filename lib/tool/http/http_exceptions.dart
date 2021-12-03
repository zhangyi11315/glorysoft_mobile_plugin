class HttpException implements Exception {
  final String? _message;

  String get message => _message ?? this.runtimeType.toString();

  final String? _code;

  String get code => _code ?? '-1';

  HttpException([this._message, this._code]);

  String toString() {
    return "code:$code--message=$message";
  }
}

/// 客户端请求错误
class BadRequestException extends HttpException {
  BadRequestException({String? message, String? code}) : super(message, code);
}
/// 服务端响应错误
class BadServiceException extends HttpException {
  BadServiceException({String? message, String? code}) : super(message, code);
}



class UnknownException extends HttpException {
  UnknownException([String? message]) : super(message);
}

class CancelException extends HttpException {
  CancelException([String? message]) : super(message);
}

class NetworkException extends HttpException {
  NetworkException({String? message, String? code}) : super(message, code);
}

/// 401
class UnauthorisedException extends HttpException {
  UnauthorisedException({String? message, String? code = '401'}) : super(message);
}

class BadResponseException extends HttpException {
  dynamic data;

  BadResponseException([this.data]) : super();
}
