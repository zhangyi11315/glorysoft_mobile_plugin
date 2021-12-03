import 'package:dio/dio.dart' as dio;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'app_dio.dart';
import 'http_response.dart';
import 'http_config.dart';
import 'http_parse.dart';
import 'http_transformer.dart';
import 'package:flutter/material.dart';

class HttpClient {
  late AppDio _dio;

  HttpClient({dio.BaseOptions? options, HttpConfig? dioConfig})
      : _dio = AppDio(options: options, dioConfig: dioConfig);

  Future<HttpResponse<T>> get<T>(String uri,
      {Map<String, dynamic>? queryParameters,
        dio.Options? options,
        dio.CancelToken? cancelToken,
        dio.ProgressCallback? onReceiveProgress,
        HttpTransformer? httpTransformer,
        bool isShowLoading = true}) async {
    try {
      if(isShowLoading) EasyLoading.show(status: 'loading...');
      var response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      if(isShowLoading) EasyLoading.dismiss();
      return handleResponse(response, httpTransformer: httpTransformer);
    } on Exception catch (e) {
      if(isShowLoading) EasyLoading.dismiss();
      return handleException(e);
    }
  }

  Future<HttpResponse<T>> post<T>(String uri,
      {data,
        Map<String, dynamic>? queryParameters,
        dio.Options? options,
        dio.CancelToken? cancelToken,
        dio.ProgressCallback? onSendProgress,
        dio.ProgressCallback? onReceiveProgress,
        HttpTransformer? httpTransformer,
        bool isShowLoading = true}) async {
    try {
      if(isShowLoading) EasyLoading.show(status: 'loading...');
      var response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      if(isShowLoading) EasyLoading.dismiss();
      return handleResponse(response, httpTransformer: httpTransformer);
    } on Exception catch (e) {
      if(isShowLoading) EasyLoading.dismiss();
      return handleException(e);
    }
  }

  Future<HttpResponse<T>> patch<T>(String uri,
      {data,
        Map<String, dynamic>? queryParameters,
        dio.Options? options,
        dio.CancelToken? cancelToken,
        dio.ProgressCallback? onSendProgress,
        dio.ProgressCallback? onReceiveProgress,
        HttpTransformer? httpTransformer,
        bool isShowLoading = true}) async {
    try {
      if(isShowLoading) EasyLoading.show(status: 'loading...');
      var response = await _dio.patch(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      if(isShowLoading) EasyLoading.dismiss();
      return handleResponse(response, httpTransformer: httpTransformer);
    } on Exception catch (e) {
      return handleException(e);
    }
  }

  Future<HttpResponse<T>> delete<T>(String uri,
      {data,
        Map<String, dynamic>? queryParameters,
        dio.Options? options,
        dio.CancelToken? cancelToken,
        HttpTransformer? httpTransformer,
        bool isShowLoading = true}) async {
    try {
      if(isShowLoading) EasyLoading.show(status: 'loading...');
      var response = await _dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      if(isShowLoading) EasyLoading.dismiss();
      return handleResponse(response, httpTransformer: httpTransformer);
    } on Exception catch (e) {
      return handleException(e);
    }
  }

  Future<HttpResponse<T>> put<T>(String uri,
      {data,
        Map<String, dynamic>? queryParameters,
        dio.Options? options,
        dio.CancelToken? cancelToken,
        HttpTransformer? httpTransformer,
        bool isShowLoading = true}) async {
    try {
      if(isShowLoading) EasyLoading.show(status: 'loading...');
      var response = await _dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      if(isShowLoading) EasyLoading.dismiss();
      return handleResponse(response, httpTransformer: httpTransformer);
    } on Exception catch (e) {
      return handleException(e);
    }
  }

  Future<dio.Response> download(String urlPath, savePath,
      {dio.ProgressCallback? onReceiveProgress,
        Map<String, dynamic>? queryParameters,
        dio.CancelToken? cancelToken,
        bool deleteOnError = true,
        String lengthHeader = dio.Headers.contentLengthHeader,
        data,
        dio.Options? options,
        HttpTransformer? httpTransformer}) async {
    try {
      var response = await _dio.download(
        urlPath,
        savePath,
        onReceiveProgress: onReceiveProgress,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        deleteOnError: deleteOnError,
        lengthHeader: lengthHeader,
        data: data,
        options: data,
      );
      return response;
    } catch (e) {
      throw e;
    }
  }

  void showLoading(context, {String? text}) {
    text = text ?? "Loading...";
    Get.dialog(Center(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(3.0),
            boxShadow: [
              //阴影
              BoxShadow(
                color: Colors.black12,
                //offset: Offset(2.0,2.0),
                blurRadius: 10.0,
              )
            ]),
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.all(16),
        constraints: BoxConstraints(minHeight: 120, minWidth: 180),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 30,
              width: 30,
              child: CircularProgressIndicator(
                strokeWidth: 3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                text,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
