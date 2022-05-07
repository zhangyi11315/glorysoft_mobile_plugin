
import 'package:flutter_easyloading/flutter_easyloading.dart';

//http错误显示是否为弹窗
var isHttpFailingModusOrDialog = false;

void showToast(String message){
  EasyLoading.showToast(message,toastPosition:EasyLoadingToastPosition.bottom);
}