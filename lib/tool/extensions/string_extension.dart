import 'package:flutter/material.dart';
import 'dart:convert';

extension StringExtension on String{

  ///16进制颜色
  Color toColor(){
    // String hex = this.replaceAll('#', '');
    // int count = 0;
    // switch (hex.length) {
    //   case 3: // #RGB
    //   case 4: // #ARGB
    //     count = 1;
    //     break;
    //   case 6: // #RRGGBB
    //   case 8: // #AARRGGBB
    //     count = 2;
    //     break;
    //   default: // 默认颜色
    //     return Colors.transparent;
    //     break;
    // }
    // List temp = [];
    // for (int i = 0; i < hex.length; i += count) {
    //   String str = hex.substring(i, i + count);
    //   temp.add(int.parse(str, radix: 16));
    // }
    // if (temp.length == 3) {
    //   temp.insert(0, 255);
    // }
    // return Color.fromRGBO(temp[1], temp[2], temp[3], temp[0] / 255.0);

    String hexColor = this.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return Color(int.parse(hexColor, radix: 16));
  }

  // Widget getImage({BoxFit fit = BoxFit.cover,double width,double height,bool circle=false}){
  //   if(this.isNotEmpty && this.contains('http')){
  //     return ExtendedImage.network(this,cache: true,fit: fit,width: width,height: height,
  //       shape:circle?BoxShape.circle:null,);
  //   }else if(this.isNotEmpty && this.length > 0 && this.indexOf('http') == -1 && this.contains('.file')){
  //     return ExtendedImage.network('${RequestPaths.imageUrlBase}/$this',cache: true,fit: fit,width: width,height: height,);
  //   }else if(this.isNotEmpty && this.length > 0){
  //     return Image.asset((this),fit: fit,);
  //   }else if(this.isEmpty){
  //     return TImage.userDefaultHeaderImage;
  //   }else{
  //     return TImage.userDefaultHeaderImage;
  //   }
  // }

  /// 判断是否是邮箱
  bool isEmail() {
    String regexEmail = '[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}';
    return RegExp(regexEmail).hasMatch(this);
  }

  /// 判断是否手机号
  bool isMobile(){
    return RegExp(r'^((13[0-9])|(14[5,7,9])|(15[^4])|(18[0-9])|(17[0,1,3,5,6,7,8])|(19)[0-9])\d{8}$').hasMatch(this);
  }

  /// string 转 int
  int toInt() {
    return int.parse(this);
  }

  /// string 转 double
  double toDouble() {
    return double.parse(this);
  }

  /// string 转bool
  bool toBool() {
    if (this.toLowerCase() == "true" ||
        this.toInt() > 0 ||
        this.toDouble() > 0 ||
        this.trim() != '' ||
        this != '') {
      return true;
    }
    return false;
  }

  /// 编码
  String toCoding() {
    String str = this.toString();
    // 对字符串进行编码
    return jsonEncode(Utf8Encoder().convert(str));
  }

  /// 解码
  String toDeCoding() {
    var list = <int>[];
    // 字符串解码
    jsonDecode(this).forEach(list.add);
    String value = Utf8Decoder().convert(list);
    return value;
  }
}