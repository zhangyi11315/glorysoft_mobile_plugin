import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:glorysoft_mobile_plugin/tool/global/global_method.dart';
import 'package:glorysoft_mobile_plugin/tool/utils/dialog_util.dart';
import 'http_exceptions.dart';

class HttpResponse<T> {
  late bool ok;
  late T? data;
  HttpException? error;

  HttpResponse._internal({this.ok = false});

  HttpResponse.success(this.data) {
    ok = true;
  }

  HttpResponse.failure({String? errorMsg, String? errorCode}) {
    error = BadRequestException(message: errorMsg, code: errorCode);
    ok = false;
    if(isHttpFailingModusOrDialog) {
      DiaLogUtil.showAlertDialog(middleText: errorMsg ?? '');
    }else{
      Get.snackbar('提示', errorMsg ?? '',
          colorText: Colors.white, backgroundColor: Colors.black87);
    }
  }

  HttpResponse.failureFormResponse({dynamic data}) {
    error = BadResponseException(data);
    ok = false;
    if(isHttpFailingModusOrDialog) {
      DiaLogUtil.showAlertDialog(middleText: data ?? '');
    }else{
      Get.snackbar('提示', data ?? '',
          colorText: Colors.white, backgroundColor: Colors.black87);
    }
  }

  HttpResponse.failureFromError([HttpException? error]) {
    error = error ?? UnknownException();
    ok = false;
    if(isHttpFailingModusOrDialog) {
      DiaLogUtil.showAlertDialog(middleText: error.message ?? '');
    }else{
      Get.snackbar('提示', error.message ?? '',
          colorText: Colors.white, backgroundColor: Colors.black87);
    }
  }
}