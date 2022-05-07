
import 'package:flutter/material.dart';
import 'package:get/get.dart';

typedef BottomSheetClickCallback = void Function(int, String);

class DiaLogUtil{

  static void showAlertDialog({required String middleText,VoidCallback? onConfirm,VoidCallback? onCancel}){
    Get.defaultDialog(
        title: '提示',
        titleStyle: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold
        ),
        radius: 12,
        backgroundColor: Colors.white,
        middleText: middleText,
        confirmTextColor: Colors.white,
        textConfirm: '确定',
        onConfirm: (){
          onConfirm?.call();
          Get.back();
        }
    );
  }

  static void showConfirmDialog({required String middleText,VoidCallback? onConfirm,VoidCallback? onCancel}){
    Get.defaultDialog(
      title: '提示',
      titleStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold
      ),
      radius: 12,
      backgroundColor: Colors.white,
      middleText: middleText,
      textCancel: '取消',
      confirmTextColor: Colors.white,
      textConfirm: '确定',
      onConfirm: (){
        onConfirm?.call();
        Get.back();
      },
      onCancel: (){
        onCancel?.call();
      }
    );
  }

  static void showTextFieldDialog({String? text,ValueChanged<String>? onConfirm,VoidCallback? onCancel}){
    TextEditingController controller = TextEditingController(text: text);
    Get.defaultDialog(
        title: '提示',
        titleStyle: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold
        ),
        radius: 12,
        backgroundColor: Colors.white,
        content: TextField(controller: controller),
        textCancel: '取消',
        textConfirm: '确定',
        confirmTextColor: Colors.white,
        onConfirm: (){
          onConfirm?.call(controller.text);
          Get.back();
        },
        onCancel: (){
          onCancel?.call();
        }
    );
  }

  static void showBottomSheet({required List<String> titleList,bool isShowArrow = false,BottomSheetClickCallback? onClickSheet}){
    var sheetList = titleList.map((title){
      return ListTile(
        title: Text(title),
        trailing: isShowArrow?Image.asset('assets/images/right_arrow.png'):null,
        onTap: (){
          onClickSheet?.call(titleList.indexOf(title),title);
          Get.back();
        },
      );
    }).toList();
    Get.bottomSheet(Wrap(
      children: ListTile.divideTiles(tiles:sheetList,context: Get.context).toList(),
    ),backgroundColor: Colors.white);
  }


}