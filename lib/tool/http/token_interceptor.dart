import 'package:dio/dio.dart';
import 'package:glorysoft_mobile_plugin/tool/utils/shared_preferences_util.dart';

class TokenInterceptor extends Interceptor{
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    //options.headers
    if(SpUtil.containsKey('token') ?? false){
      options.headers['hiToken'] = SpUtil.getString('token');

    }
    handler.next(options);
  }
}