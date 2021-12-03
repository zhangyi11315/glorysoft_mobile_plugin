import 'package:dio/dio.dart';
import 'http_exceptions.dart';
import 'http_response.dart';
import 'http_transformer.dart';

class DefaultHttpTransformer extends HttpTransformer {
  @override
  HttpResponse<T> parse<T>(Response response) {
    if (response.data['Response']['Header']['Success'] == true) {
      if(_isTokenTimeout(response.data['Response']['Header']['ErrorCode'])) {
        return HttpResponse.failureFromError(
            UnauthorisedException(message: "没有权限", code: '401'));
      }{
        return HttpResponse.success(response.data["Response"]["Body"]);
      }
    } else {
      return HttpResponse.failure(
          errorMsg: response.data["Response"]["Header"]["ErrorInfo"], errorCode: response.data["Response"]["Header"]["ErrorCode"]);
    }
  }

  //token验证
  bool _isTokenTimeout(String? code) {
    return code == '401';
  }

  /// 单例对象
  static DefaultHttpTransformer _instance = DefaultHttpTransformer._internal();

  /// 内部构造方法，可避免外部暴露构造函数，进行实例化
  DefaultHttpTransformer._internal();

  /// 工厂构造方法，这里使用命名构造函数方式进行声明
  factory DefaultHttpTransformer.getInstance() => _instance;
}
