import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'http_exceptions.dart';

class HttpResponse<T> {
  late bool ok;
  late T? data;
  HttpException? error;

  HttpResponse._internal({this.ok = false});

  HttpResponse.success(this.data) {
    this.ok = true;
  }

  HttpResponse.failure({String? errorMsg, String? errorCode}) {
    this.error = BadRequestException(message: errorMsg, code: errorCode);
    this.ok = false;
    Get.snackbar('提示', errorMsg ?? '',
        colorText: Colors.white, backgroundColor: Colors.black87);
  }

  HttpResponse.failureFormResponse({dynamic data}) {
    this.error = BadResponseException(data);
    this.ok = false;
    Get.snackbar('提示', data ?? '',
        colorText: Colors.white, backgroundColor: Colors.black87);
  }

  HttpResponse.failureFromError([HttpException? error]) {
    this.error = error ?? UnknownException();
    this.ok = false;
    Get.snackbar('提示', error?.message ?? '',
        colorText: Colors.white, backgroundColor: Colors.black87);
  }
}